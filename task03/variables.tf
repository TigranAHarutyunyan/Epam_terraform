variable "resource_group_name" {
  description = "Name of the Azure resource group to create."
  type        = string
}
variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
  default     = "West Europe"
}
variable "storage_account_name" {
  description = "Globally unique name for the Azure storage account."
  type        = string
}
variable "account_tier" {
  description = "Performance tier for the storage account (Standard or Premium)."
  type        = string
}
variable "account_replication_type" {
  description = "Replication type for the storage account (LRS, GRS, ZRS, etc.)."
  type        = string
}
variable "vnet_name" {
  description = "Name of the Azure virtual network."
  type        = string
}
variable "vnet_address_space" {
  description = "Address space CIDR blocks for the virtual network."
  type        = list(string)
}
variable "subnet1_name" {
  description = "Name of the first subnet, typically a frontend subnet."
  type        = string
}
variable "subnet1_prefix" {
  description = "Address prefixes for the first subnet."
  type        = list(string)
}
variable "subnet2_name" {
  description = "Name of the second subnet, typically a backend subnet."
  type        = string
}
variable "subnet2_prefix" {
  description = "Address prefixes for the second subnet."
  type        = list(string)
}
variable "creator" {
  description = "Identifier or email used to tag created resources."
  type        = string
}
