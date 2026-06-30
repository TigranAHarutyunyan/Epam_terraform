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
variable "log_analytics_name" {
  type        = string
  description = "Name of Log Analytics"
}
variable "name_env" {
  type        = string
  description = "Name of Env"
}
variable "aca_name" {
  type        = string
  description = "Name of aca"
}
variable "workload_profile_type" {
  type        = string
  description = "Name of workload"
}
variable "aca-login-server" {
  type        = string
  description = "Name of Server"
}
variable "image_name" {
  type        = string
  description = "Name of Image"
}
variable "scope" {
  type        = string
  description = "Scope"
}
variable "user_identity_name" {
  type        = string
  description = "Name of User identity"
}
variable "tenant_id" {
  type        = string
  description = "Tenant ID"
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