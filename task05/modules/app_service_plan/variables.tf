variable "name" {
  description = "App Service Plan name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the App Service Plan"
  type        = string
}

variable "location" {
  description = "Location of the App Service Plan"
  type        = string
}

variable "sku" {
  description = "SKU name for the App Service Plan"
  type        = string
}

variable "os_type" {
  description = "OS type for the App Service Plan"
  type        = string
}

variable "worker_count" {
  description = "Worker count for the App Service Plan"
  type        = number
}
variable "creator" {
    description = "creator of resource "
    type = string
}