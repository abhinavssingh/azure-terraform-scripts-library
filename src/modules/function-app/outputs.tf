###########################
## Function App Outputs
###########################

output "function_app_id" {
  value = azurerm_windows_function_app.functionapp.id
}

output "function_app_name" {
  value = azurerm_windows_function_app.functionapp.name
}