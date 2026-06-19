output "tenant_id" {
  value       = data.azurerm_client_config.current.tenant_id
  description = "Tenat Id "
}
output "random_password" {
  value       = random_password.sql_admin_password.result
  description = "random password "
}