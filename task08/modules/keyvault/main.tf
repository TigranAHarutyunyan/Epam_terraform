resource "azurerm_key_vault" "kv" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  tenant_id           = var.tenand_id
  sku_name            = var.sku_name
  tags = {
    Creator = var.creator
  }
}
resource "azurerm_key_vault_secret" "redis-hostname" {
  name         = var.key_vault_redis_hostname
  key_vault_id = azurerm_key_vault.kv.id
  value        = var.redis-hostname
}
resource "azurerm_key_vault_secret" "redis-primary-key" {
  name         = var.key_vault_redis_primary_key
  key_vault_id = azurerm_key_vault.kv.id
  value        = var.redis-primary-key
}