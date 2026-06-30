output "application_archive_sas_url" {
  value       = "${azurerm_storage_blob.app-blob.url}${data.azurerm_storage_account_blob_container_sas.sas-contanier.sas}"
  sensitive   = true
  description = "Shared Access Signature"
}
output "app_archive_url" {
  value       = azurerm_storage_blob.app-blob.url
  description = "Url of archive in the blob"
}
output "app-archive-sas-token" {
  value       = data.azurerm_storage_account_blob_container_sas.sas-contanier.sas
  sensitive   = true
  description = "Token of Auth"
}