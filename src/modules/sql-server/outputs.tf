###########################
## Sql Server Outputs
###########################

output "sql_server_name" {
  value = azurerm_mssql_server.sqlserver.name
}

output "sql_server_id" {
  value = azurerm_mssql_server.sqlserver.id
}

output "sql_server_url" {
  value = azurerm_mssql_server.sqlserver.fully_qualified_domain_name
}
