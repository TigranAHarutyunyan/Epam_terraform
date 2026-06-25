provider "azurerm" {
  feature {}
}
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags = {
    Creator = var.creator
  }
}
module "aci" {
  source = "./modules/aci"


}
module "acr" {
  source = "./modules/acr"
    name = local.acr_name
    rg_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    sku = var.acr_sku
    creator = var.creator
    docker_image_name = local.docker_image
}
module "aks" {
  source = "./modules/aks"

}
data "azurerm_client_config" "current" {}
module "keyvault" {
  source                      = "./modules/keyvault"
  name                        = local.keyvault_name
  location                    = azurerm_resource_group.rg.location
  rg_name                     = azurerm_resource_group.rg.name
  tenand_id                   = data.azurerm_client_config.current.tenand_id
  sku_name                    = var.key_vault_sku
  creator                     = var.creator
  redis-hostname              = module.redis.redis_hostname
  redis-primary-key           = module.redis_primary_key
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