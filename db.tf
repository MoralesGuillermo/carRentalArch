// Database creation
// Central resource to store our databases
resource "azurerm_mssql_server" "sqlserver" {
  name                         = "dbserver-${var.project}-${var.environment}"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = var.admin_sql_password
  tags                         = var.tags
}

resource "azurerm_mssql_database" "oltpdb" {
    name                = "oltpdb${var.project}${var.environment}"
    server_id           = azurerm_mssql_server.sqlserver.id
    sku_name            = "S0"
    tags                = var.tags
}

resource "azurerm_mssql_database" "dwdb" {
    name                = "dwdb${var.project}${var.environment}"
    server_id           = azurerm_mssql_server.sqlserver.id
    sku_name            = "S0"
    tags                = var.tags
}