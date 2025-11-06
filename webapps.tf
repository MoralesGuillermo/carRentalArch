// Apps Web Server

resource "azurerm_service_plan" "sp" {
    name = "sp-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.main.name
    sku_name = "B1"
    os_type = "Linux"
}

resource "azurerm_linux_web_app" "carRentalUI" {
    // Resource metadata
    name                = "ui-${var.project}-${var.environment}"
    location            = var.location
    resource_group_name = azurerm_resource_group.main.name
    service_plan_id     = azurerm_service_plan.sp.id

    // Deployment method
    site_config {
        always_on = true
        application_stack {
          docker_registry_url = "https://index.docker.io"
          docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }
}


resource "azurerm_linux_web_app" "carRentalAPI" {
    // Resource metadata
    name                = "api-${var.project}-${var.environment}"
    location            = var.location
    resource_group_name = azurerm_resource_group.main.name
    service_plan_id     = azurerm_service_plan.sp.id

    // Deployment method
    site_config {
        always_on = true
        application_stack {
          docker_registry_url = "https://index.docker.io"
          docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }
}
