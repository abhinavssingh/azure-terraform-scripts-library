###########################
## Inbound Data Factory Outputs
###########################

output "data_factory_id" {
  value = azurerm_data_factory.adf.id
}

output "data_factory_name" {
  value = azurerm_data_factory.adf.name
}