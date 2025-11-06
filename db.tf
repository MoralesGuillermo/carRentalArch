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