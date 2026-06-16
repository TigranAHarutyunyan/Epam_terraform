output "name" {
  description = "Web app's  name"
  value       = azurerm_windows_web_app.this.name
}
output "id" {
    description = "Web app's id "
    value = azurerm_windows_web_app.this.id
}