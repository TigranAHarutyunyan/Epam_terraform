output "key_vault_id" {
  value       = azurerm_key_vault.kv.id
  description = "id of keyvault"
}
output "kv-name" {
  value       = azurerm_key_vault.kv.name
  description = "Name of Key Vauilt"
}