variable "name" {
  description = "Resource group name"
  type        = string
}
variable "resource_group_name" {
  description = "Name of resource_group"
  type        = string
}
variable "traffic_routing_method" {
  description = "Name of Method"
  type        = string
}
variable "endpoint_name" {
  description = "Name of Endpoint"
  type        = string
}
variable "target_resource_id" {
  description = "List of target resource id"
  type        = list(string)
}
variable "creator" {
  description = "Email of creator"
  type        = string
}