###########################
## Function App Outputs
###########################

output "function_app_id" {
  value = azurerm_windows_function_app.functionapp.id
}

output "function_app_name" {
  value = azurerm_windows_function_app.functionapp.name
}

output "function_app_principle_id" {
  value = azurerm_windows_function_app.functionapp.identity[0].principal_id
}