provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags = {
    Creator = var.creator
  }
}

data "azurerm_client_config" "current" {}

module "aci" {
  source            = "./modules/aci"
  name              = local.aci_name
  location          = azurerm_resource_group.rg.location
  rg_name           = azurerm_resource_group.rg.name
  sku               = var.aci_sku
  creator           = var.creator
  login_server      = module.acr.login_server
  admin_username    = module.acr.admin_username
  admin_password    = module.acr.admin_password
  docker_image_name = local.docker_image
  redis-hostname    = module.redis.redis_hostname
  redis-primary-key = module.redis.redis_primary_key

  depends_on = [module.acr]
}
module "acr" {
  source            = "./modules/acr"
  name              = local.acr_name
  rg_name           = azurerm_resource_group.rg.name
  location          = azurerm_resource_group.rg.location
  sku               = var.acr_sku
  creator           = var.creator
  docker_image_name = local.docker_image
  git_pat           = var.git_pat
  dockerfile_path   = var.dockerfile_path
  context_path      = var.context_path
}
module "keyvault" {
  source                      = "./modules/keyvault"
  name                        = local.keyvault_name
  location                    = azurerm_resource_group.rg.location
  rg_name                     = azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sp_object_id                = data.azurerm_client_config.current.object_id
  sku_name                    = var.key_vault_sku
  creator                     = var.creator
  redis-hostname              = module.redis.redis_hostname
  redis-primary-key           = module.redis.redis_primary_key
  key_vault_redis_hostname    = var.key_vault_redis_hostname
  key_vault_redis_primary_key = var.key_vault_redis_primary_key
}
module "redis" {
  source   = "./modules/redis"
  name     = local.redis_name
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  capacity = var.arcs_capacity
  sku      = var.arcs_sku
  family   = var.arcs_sku_family
  creator  = var.creator
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "company"

  default_node_pool {
    name            = var.pool_name
    node_count      = var.pool_instance_count
    vm_size         = var.pool_instance_node_size
    os_disk_type    = var.pool_disk_type
    os_disk_size_gb = 100
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  tags = {
    Creator = var.creator
  }

  depends_on = [module.keyvault]
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = module.acr.acr_id
  role_definition_name = "ACRpull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

resource "azurerm_key_vault_access_policy" "aks_secrets_provider" {
  key_vault_id       = module.keyvault.key_vault_id
  object_id          = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].object_id
  secret_permissions = ["Get", "List"]
  tenant_id          = data.azurerm_client_config.current.tenant_id
}
