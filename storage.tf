// Data Lake configuration

resource "azurerm_storage_account" "saccount" {
  name                     = "sa${var.project}${var.environment}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  // Locally Redundant Storage for cost efficiency
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_storage_container" "datalake" {
  name                  = "datalake"
  container_access_type = "private"
  storage_account_id    = azurerm_storage_account.saccount.id
}


