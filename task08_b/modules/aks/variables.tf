variable "name" {
  type        = string
  description = "name of Azure  Container Registry"
}
variable "rg_name" {
  type        = string
  description = "Name of Resource group"
}
variable "location" {
  type        = string
  description = "Location"
}
variable "node_pool_name" {
  type        = string
  description = "Name of pool"
}
variable "node_pool_instance_count" {
  type        = number
  description = "Instance count"
}
variable "node_pool_instance_node_size" {
  type        = string
  description = "Size of Node"
}
variable "node_pool_os_disk_type" {
  type        = string
  description = "type os disk"
}
variable "creator" {
  type        = string
  description = "Name of Creator"
}
variable "scope" {
  type        = string
  description = "Scope"
}
variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}
variable "key_vault_id" {
  type        = string
  description = "Id of keyvault"
}