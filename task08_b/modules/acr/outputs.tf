output "acr-login-server" {
  value       = azurerm_container_registry.acr.login_server
  description = "Login server of ACR"
}
output "acr-id" {
  value       = azurerm_container_registry.acr.id
  description = "Id of ACR"
}