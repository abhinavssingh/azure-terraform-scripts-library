resource "azurerm_mssql_server" "sqlserver" {
  name                         = "${var.environment}-sql-${var.locationname}-${var.project}-consumer-sqldbsrv"
  resource_group_name          = var.resourcegroupname
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "<enter user name>"
  administrator_login_password = "<Enter administator passwords>"
  minimum_tls_version          = "1.2"
  tags = var.tags
}

# below block provide current subscription details
data "azurerm_subscription" "primary" {
}

# below blocks enable sql auditing in storage account
resource "azurerm_mssql_server_extended_auditing_policy" "sqlauditlogging" {
  storage_endpoint       = var.blob_endpoint
  server_id              = azurerm_mssql_server.sqlserver.id
  enabled = true
  retention_in_days      = 180
  log_monitoring_enabled = false
  storage_account_subscription_id = data.azurerm_subscription.primary.subscription_id
  storage_account_access_key = var.sa_primary_access_key
}