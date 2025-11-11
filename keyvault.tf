
resource "azurerm_key_vault" "secrets" {
  name                        = "keyvault-${var.project}-${var.environment}"
  resource_group_name         = azurerm_resource_group.main.name
  location                    = azurerm_resource_group.main.location
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  sku_name                    = "standard"
  // Use roles for auth
  rbac_authorization_enabled  = true
}