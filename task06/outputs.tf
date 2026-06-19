output "tenant_id" {
  value       = data.azurerm_client_config.current.tenant_id
  description = "Tenat Id "
}
output "random_password" {
  random_password.sql_admin_password.result
}