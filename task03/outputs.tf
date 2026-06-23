output "rg_id" {
  description = "The ID of the Azure resource group created by this configuration."
  value       = azurerm_resource_group.rg.id
}
output "sa_blob_endpoint" {
  description = "The primary blob service endpoint for the Azure storage account."
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}
output "vnet_id" {
  description = "The ID of the Azure virtual network created by this configuration."
  value       = azurerm_virtual_network.vnet.id
}
