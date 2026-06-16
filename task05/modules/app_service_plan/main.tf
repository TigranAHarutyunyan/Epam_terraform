resource "azurerm_service_plan" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku
  os_type             = var.os_type
  worker_count        = var.worker_count
  tags = {
    Creator = var.creator
  }
}