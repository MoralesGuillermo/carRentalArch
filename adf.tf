// Azure Data Factory for ETL processes
resource "azurerm_data_factory" "adfetl" {
  name                = "adfetl-${var.project}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.tags
}
