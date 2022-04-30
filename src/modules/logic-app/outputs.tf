###########################
## Logic App Outputs
###########################

output "logic_app_id" {
  value = azurerm_logic_app_workflow.logicapp.id
}

output "logic_app_name" {
  value = azurerm_logic_app_workflow.logicapp.name
}

output "logic_app_weia" {
  value = azurerm_logic_app_workflow.logicapp.workflow_endpoint_ip_addresses
}

output "logic_app_ae" {
  value = azurerm_logic_app_workflow.logicapp.access_endpoint
}

output "logic_app_ceip" {
  value = azurerm_logic_app_workflow.logicapp.connector_endpoint_ip_addresses
}
