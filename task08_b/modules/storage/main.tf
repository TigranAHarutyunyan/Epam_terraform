resource "azurerm_storage_account" "storage" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type

  tags = {
    Creator = var.creator
  }
}
resource "azurerm_storage_container" "asc" {
  name                  = var.sa_container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.conatiner_access_type
}
resource "azurerm_storage_blob" "app-blob" {
  name                   = "Tar  blob"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.asc.name
  type                   = "Block"
  source                 = var.path_tar
}
data "azurerm_storage_account_blob_container_sas" "sas-contanier" {
  connection_string = azurerm_storage_account.storage.primary_connection_string
  container_name    = azurerm_storage_container.asc.name
  start             = timestamp()
  expiry            = timeadd(timestamp(), "24h")
  permissions {
    read   = true
    write  = false
    delete = false
    add    = false
    list   = true
    create = false
  }
}