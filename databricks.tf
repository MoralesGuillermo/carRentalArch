// Deploy a databricks workspace

resource "azurerm_databricks_workspace" "dbricks" {
  name                        = "databricks-${var.project}-${var.environment}"
  resource_group_name         = azurerm_resource_group.main.name
  location                    = azurerm_resource_group.main.location
  sku                         = "standard"
  tags                        = var.tags
}