resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = true
  tags = {
    Creator = var.creator
  }
}
resource "azurerm_container_registry_task" "acr_task" {
  name                  = "build"
  container_registry_id = azurerm_container_registry.acr.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = "Dockerfile"
    context_access_token = var.context_access_token
    context_path         = var.context_path
    image_names          = [var.image_name]
  }
}
resource "azurerm_container_registry_task_schedule_run_now" "build_now" {
  container_registry_task_id = azurerm_container_registry_task.acr_task.id

  depends_on = [azurerm_container_registry_task.acr_task]
}

