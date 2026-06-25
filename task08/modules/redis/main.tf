resource "azurerm_redis_cache" "redis" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.rg_name
  capacity            = var.capacity
  family              = var.capacity
  sku_name            = var.sku
  tags = {
    Creator = var.creator
  }
}