resource "azurerm_windows_web_app" "this" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    always_on = true

    ip_restriction {
      name       = var.allow_IP_rule_name
      action     = "Allow"
      ip_address = var.Verification_IP_address
      priority   = 100
    }
    ip_restriction {
      name        = var.allow_IP_rule_name
      action      = "Allow"
      service_tag = "AzureTrafficManager"
      priority    = 101

    }
  }
  tags = {
    Creator = var.creator
  }
}