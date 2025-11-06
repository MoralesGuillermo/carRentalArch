// Apps Web Server

resource "azurerm_service_plan" "sp" {
    name = "sp-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.main.name
    sku_name = "B1"
    os_type = "Linux"
}

