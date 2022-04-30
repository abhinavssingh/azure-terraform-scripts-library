###########################
## Application Insights Outputs
###########################

output "appinsights_id" {
  value = azurerm_application_insights.appinsights.id
}

output "appinsights_name" {
  value = azurerm_application_insights.appinsights.name
}

output "appinsights_instrumentation_key" {
  value = azurerm_application_insights.appinsights.instrumentation_key
}

output "appinsights_connection_string" {
  value = azurerm_application_insights.appinsights.connection_string
}