variable "name_prefix" {
  type        = string
  description = "Name prefix of resources"
}
variable "creator" {
  type        = string
  description = "Email of Creator"
}
variable "location" {
  type        = string
  description = "location"
}
variable "acr_sku" {
  type        = string
  description = "SKU"
}
variable "account_replication_type" {
  type        = string
  description = "account replication type"
}
variable "sa_container_name" {
  type        = string
  description = "Name of Storage conmatiner"
}
variable "conatiner_access_type" {
  type        = string
  description = "Acces type"
}

variable "keyvault_sku" {
  type        = string
  description = "SKU of Key value"
}
variable "aci-redis-sku" {
  type        = string
  description = "SKU of ACI-redis"
}
variable "workload_profile_type" {
  type        = string
  description = "Name of workload"
}
variable "redis-password" {
  type        = string
  description = "Password"
}
variable "redis-hostname" {
  type        = string
  description = "Hostname"
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
variable "name_postfix" {
  type        = string
  description = "name postfix"
}