data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                = "${var.environment}-kv-${var.locationname}-${var.project}keyvault"
  location            = var.location
  resource_group_name = var.resourcegroupname
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true
  sku_name = "standard"
  tags = var.tags
}

resource "azurerm_role_assignment" "keyvaultrole" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Administrator" // this role is required to set access policy. Without this role even service principal can also not set access policy.
  principal_id         = var.object_id
}

# Least access process i have followed. Please change as per your requirement.
resource "azurerm_key_vault_access_policy" "accesspolicy" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id
  certificate_permissions = [
      "Get",
      "List",
    ]

  key_permissions = [
      "Get",
      "List",
    ]

  secret_permissions = [
      "Get",
      "List",
    ]
}

# grants access to function app in key vault. then only function app can communicate with key vault
resource "azurerm_key_vault_access_policy" "functionapp1accesspolicy" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.functionapp_object_id
  certificate_permissions = [
      "Get",
      "List",
    ]

  key_permissions = [
      "Get",
      "List",
    ]

  secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set",
    ]
}

resource "azurerm_key_vault_secret" "secret" {
  name         = "test" // specify your key
  value        = "123456789" // specify your value
  key_vault_id = azurerm_key_vault.keyvault.id
}