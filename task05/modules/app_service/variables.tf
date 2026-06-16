variable "app_name" {
  description = "Name of app "
  type        = string
}
variable "location" {
  description = "location of webapp "
  type        = string
}
variable "resource_group_name" {
  description = "Name of Resource Group"
  type        = string
}
variable "service_plan_id" {
  description = "Id of service_plan"
  type        = string
}

variable "creator" {
  description = "creator of resource "
  type        = string
}

variable "ip_restrictions" {
  description = "IP restriction rules for the web app"
  type = list(object({
    name        = string
    action      = string
    priority    = number
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}
