###########################
## Storage Account Outputs
###########################

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "storage_account_id" {
  value = azurerm_storage_account.sa.id
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.sa.primary_access_key
}

output "storage_account_primary_connection_string" {
  value = azurerm_storage_account.sa.primary_connection_string
}