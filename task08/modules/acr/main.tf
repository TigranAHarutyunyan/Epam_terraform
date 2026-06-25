resource "azurerm_container_registry" "acr" {
  name = var.name
  resource_group_name = var.rg_name
  location = var.location
  sku = var.sku
admin_enabled       = true
}

resource "azurerm_container_registry_task" "acr_task" {
  name = "task_name"
  container_registry_id = azurerm_container_registry.acr.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path = "../application/Dockerfile"
    context_path = "."
    image_names = [ var.docker_image_name ]
    context_access_token = "..."
  }
}