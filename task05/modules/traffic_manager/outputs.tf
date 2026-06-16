output "traffic_manager_fqdn" {
    description = "FQDN of traffic manager"
    value = azurerm_traffic_manager_profile.this.fqdn 
}