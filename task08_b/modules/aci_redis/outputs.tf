output "redis_fqdn" {
  value       = azurerm_container_group.acg.fqdn
  description = "FQDN of Redis"
}

output "redis_hostname_secret_name" {
  value       = azurerm_key_vault_secret.redis-hostname.name
  description = "Key Vault secret name for the Redis hostname"
}

output "redis_password_secret_name" {
  value       = azurerm_key_vault_secret.redis-password.name
  description = "Key Vault secret name for the Redis password"
}
output "redis_ip" {
  value       = azurerm_container_group.acg.ip_address
  description = "Public IP address of Redis ACI"
}