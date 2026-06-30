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
variable "creator" {
  type        = string
  description = "Email of Creator"
}
variable "tenant_id" {
  type        = string
  description = "tenant Id"
}
variable "sku" {
  type        = string
  description = "sku of Keyvault"
}
variable "object_id" {
  type        = string
  description = "Object ID"
}