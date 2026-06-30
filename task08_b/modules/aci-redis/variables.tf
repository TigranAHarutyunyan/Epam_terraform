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
variable "sku" {
  type        = string
  description = "SKU of ACI-redis"
}
variable "key_vault_id" {
  type        = string
  description = "Id of keyvault"
}
variable "redis-password" {
  type        = string
  description = "Password"
}
variable "redis-hostname" {
  type        = string
  description = "Hostname"
}
variable "login-server" {
  type        = string
  description = "Login Server"
}