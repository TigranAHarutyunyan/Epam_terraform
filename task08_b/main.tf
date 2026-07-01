provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
provider "kubectl" {
  host                   = module.aks.host
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  load_config_file       = false
}
provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}
data "azurerm_client_config" "current" {}
data "archive_file" "application" {
  type        = "tar.gz"
  source_dir  = "${path.module}/application"
  output_path = "${path.module}/application.tar.gz"
}
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

module "aca" {
  source                = "./modules/aca"
  name                  = local.aca_name
  rg_name               = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  log_analytics_name    = local.log_analytics_name
  name_env              = local.aca_env_name
  aca_name              = local.aca_name
  workload_profile_type = var.workload_profile_type
  aca-login-server      = module.acr.acr-login-server
  image_name            = local.docker_image
  scope                 = module.acr.acr-id
  user_identity_name    = local.user_identity_name
  tenant_id             = data.azurerm_client_config.current.tenant_id
  key_vault_id          = module.keyvault.key_vault_id
  redis-hostname        = var.redis-hostname
  redis-password        = var.redis-password
  depends_on            = [module.aci-redis]
}



module "aci-redis" {
  source         = "./modules/aci_redis"
  name           = local.redis_aci_name
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  creator        = var.creator
  sku            = var.aci-redis-sku
  key_vault_id   = module.keyvault.key_vault_id
  redis-hostname = var.redis-hostname
  redis-password = var.redis-password
  login-server   = module.acr.acr-login-server
  tenant_id      = data.azurerm_client_config.current.tenant_id
  object_id      = data.azurerm_client_config.current.object_id
  depends_on     = [module.keyvault]
}



module "acr" {
  source               = "./modules/acr"
  name                 = local.acr_name
  rg_name              = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  sku                  = var.acr_sku
  context_path         = module.storage.app_archive_url
  creator              = var.creator
  context_access_token = module.storage.app-archive-sas-token
  image_name           = local.docker_image

}


module "aks" {
  source                       = "./modules/aks"
  name                         = local.aks_name
  rg_name                      = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  node_pool_name               = var.node_pool_name
  node_pool_instance_count     = var.node_pool_instance_count
  node_pool_instance_node_size = var.node_pool_instance_node_size
  node_pool_os_disk_type       = var.node_pool_os_disk_type
  creator                      = var.creator
  scope                        = module.acr.acr-id
  tenant_id                    = data.azurerm_client_config.current.tenant_id
  key_vault_id                 = module.keyvault.key_vault_id


}

module "k8s" {
  source                           = "./modules/k8s"
  manifests_path                   = "${path.module}/k8s-manifests"
  image_name                       = local.docker_image
  acr_login_server                 = module.acr.acr-login-server
  tenant_id                        = data.azurerm_client_config.current.tenant_id
  aks_kv_access_identity_client_id = module.aks.aks_kv_access_identity_client_id
  kv-name                          = module.keyvault.kv-name
  redis-hostname                   = module.aci-redis.redis_hostname_secret_name
  redis-password                   = module.aci-redis.redis_password_secret_name
}



module "keyvault" {
  source    = "./modules/keyvault"
  name      = local.keyvault_name
  rg_name   = azurerm_resource_group.rg.name
  location  = azurerm_resource_group.rg.location
  creator   = var.creator
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku       = var.keyvault_sku
  object_id = data.azurerm_client_config.current.object_id
}


module "storage" {
  source                   = "./modules/storage"
  name                     = local.sa_name
  rg_name                  = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_replication_type = var.account_replication_type
  creator                  = var.creator
  conatiner_access_type    = var.conatiner_access_type
  sa_container_name        = var.sa_container_name
  path_tar                 = data.archive_file.application.output_path
}
