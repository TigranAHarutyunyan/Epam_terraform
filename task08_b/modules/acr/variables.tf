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
variable "sku" {
  type        = string
  description = "SKU"
}
variable "creator" {
  type        = string
  description = "Name of creator"
}
variable "context_path" {
  type        = string
  description = "Context path of project"
}
variable "context_access_token" {
  type        = string
  description = "Token "
}
variable "image_name" {
  type        = string
  description = "Name of Image"
}
