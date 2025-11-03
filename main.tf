provider "azurerm" {
    subscription_id = var.subscription_id
    features {}
}

resource "azurerm_resource_group" "main" {
    name     = "rg-${var.project}-${var.environment}"
    location = var.location
    tags = var.tags
}