resource "azurerm_resource_group" "rg" {
  name     = "rozmowa-o-prace"
  location = "centerpoland" # lokalizacaj serwera
}

resource "azurerm_service_plan" "plan" {
  name                = "Plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1" # F1 jest DARMOWY. Jeśli nie zadziała z Dockerem, zmień na "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "aplikacja"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.plan.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_image_name   = "ghcr.io/MaayoAko/my-devops-project:latest"
      docker_registry_url = "https://ghcr.io"
      # Jeśli repo jest prywatne, będziesz musiał dodać credentials
    }
  }
  
  app_settings = {
    "WEBSITES_PORT" = "8000" # Ważne: Mówi Azure na jakim porcie działa kontener
  }
}