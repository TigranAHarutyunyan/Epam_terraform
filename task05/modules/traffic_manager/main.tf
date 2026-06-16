resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  dns_config {
    relative_name = "tm-app"
    ttl           = 60
  }

  monitor_config {
    protocol = "HTTPS"
    port     = 443
    path     = "/"
  }
  tags = {
    Creator = var.creator
  }
}



resource "azurerm_traffic_manager_azure_endpoint" "this" {
  count              = length(var.target_resource_id)
  name               = "${var.endpoint_name}-${count.index + 1}"
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = var.target_resource_id[count.index]
  enabled            = true
  priority           = 1

}
