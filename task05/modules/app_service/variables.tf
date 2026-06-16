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
variable "allow_IP_rule_name" {
  description = "Name of IP rule"
  type        = string
}

variable "Verification_IP_address" {
  description = "IP address Verification"
  type        = string
}
variable "creator" {
  description = "creator of resource "
  type        = string
}