variable "name" {
  type        = string
  description = "Name of Redis Cache"
}
variable "rg_name" {
  type        = string
  description = "Name od Resource group"
}
variable "capacity" {
  type        = number
  description = "Count of Capacity"
}
variable "location" {
  type        = string
  description = "Location"
}
variable "sku" {
  type        = string
  description = "sku of reddis"
}
variable "family" {
  type        = string
  description = "name of family"
}
variable "creator" {
  type        = string
  description = "name of creator"
}  