variable "manifests_path" {
  type        = string
  description = "Base Path to the kubernetes files"
}
variable "image_name" {
  type        = string
  description = "Name of Image"
}
variable "acr_login_server" {
  type        = string
  description = "Login Server"
}
variable "aks_kv_access_identity_client_id" {
  type        = string
  description = "Client ID of AKS Key Vault Secrets Provider managed identity"
}
variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}
variable "kv-name" {
  type        = string
  description = "Name of key vault"
}
variable "redis-password" {
  type        = string
  description = "Password"
}
variable "redis-hostname" {
  type        = string
  description = "Hostname"
}
