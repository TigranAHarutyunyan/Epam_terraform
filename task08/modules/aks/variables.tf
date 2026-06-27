variable "aks_kube_config" {
  type = object({
    host                   = string
    client_certificate     = string
    client_key             = string
    cluster_ca_certificate = string
  })
  description = "AKS connection details for the Kubernetes providers"
}

variable "k8s_inputs" {
  type = object({
    acr_login_server           = string
    app_image_name             = string
    aks_kv_access_identity_id  = string
    key_vault_name             = string
    redis_url_secret_name      = string
    redis_password_secret_name = string
    tenant_id                  = string
  })
  description = "Inputs required to render and apply the Kubernetes manifests"
}
