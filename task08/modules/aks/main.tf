terraform {
  required_version = ">= 1.5.7"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.30.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 1.14.0"
    }
  }
}

data "terraform_remote_state" "infra" {
  backend = "local"
  config = {
    path = abspath("${path.module}/../terraform.tfstate")
  }
}

locals {
  infra = data.terraform_remote_state.infra.outputs
}

provider "kubernetes" {
  host                   = local.infra.aks_kube_config.host
  client_certificate     = base64decode(local.infra.aks_kube_config.client_certificate)
  client_key             = base64decode(local.infra.aks_kube_config.client_key)
  cluster_ca_certificate = base64decode(local.infra.aks_kube_config.cluster_ca_certificate)
}

provider "kubectl" {
  load_config_file       = false
  host                   = local.infra.aks_kube_config.host
  client_certificate     = base64decode(local.infra.aks_kube_config.client_certificate)
  client_key             = base64decode(local.infra.aks_kube_config.client_key)
  cluster_ca_certificate = base64decode(local.infra.aks_kube_config.cluster_ca_certificate)
}

data "kubernetes_service_v1" "app" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  depends_on = [kubectl_manifest.app_service]
}

resource "kubectl_manifest" "app_deployment" {
  yaml_body = templatefile("${path.module}/../k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = local.infra.k8s_inputs.acr_login_server
    app_image_name   = local.infra.k8s_inputs.app_image_name
    image_tag        = "latest"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "app_service" {
  yaml_body = file("${path.module}/../k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }
}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/../k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = local.infra.k8s_inputs.aks_kv_access_identity_id
    kv_name                    = local.infra.k8s_inputs.key_vault_name
    redis_url_secret_name      = local.infra.k8s_inputs.redis_url_secret_name
    redis_password_secret_name = local.infra.k8s_inputs.redis_password_secret_name
    tenant_id                  = local.infra.k8s_inputs.tenant_id
  })
}
