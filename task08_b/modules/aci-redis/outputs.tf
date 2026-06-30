output "redis_fqdn" {
  value       = azurerm_container_group.acg.fqdn
  description = "FQDN of Redis"
}