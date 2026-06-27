output "aks_kube_config" {
  value = {
    host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
    client_certificate     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
    client_key             = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
    cluster_ca_certificate = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
  }
  sensitive   = true
  description = "AKS connection details for the Kubernetes layer"
}

output "k8s_inputs" {
  value = {
    acr_login_server           = module.acr.login_server
    app_image_name             = local.docker_image
    aks_kv_access_identity_id  = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].client_id
    key_vault_name             = module.keyvault.key_vault_name
    redis_url_secret_name      = var.key_vault_redis_hostname
    redis_password_secret_name = var.key_vault_redis_primary_key
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  }
  description = "Inputs required by the Kubernetes layer"
}

output "aci_fqdn" {
  value       = module.aci.aci_fqdn
  description = "FQDN of App in Azure Container Instance"
}

output "aks_lb_ip" {
  value       = module.aks.aks_lb_ip
  description = "IP of the Load Balancer"
}