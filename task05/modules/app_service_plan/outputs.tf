output "name" {
  description = "Resource group name"
  value       = azurerm_service_plan.this.name
}
output "service_plan_id" {
    description = "ID ok service plan"
    value = azurerm_service_plan.this.id
}
