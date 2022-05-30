# Overview

Terraform module to generate Azure Data Factory.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | resource |
| [azurerm_data_factory_integration_runtime_azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_azure) | resource |
| [azurerm_data_factory_linked_service_azure_blob_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_azure_blob_storage) | resource |
| [azurerm_data_factory_linked_service_azure_function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_azure_function) | resource |
| [azurerm_data_factory_linked_service_azure_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_azure_sql_database) | resource |
| [azurerm_data_factory_linked_service_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_sql_server) | resource |
| [azurerm_data_factory_custom_dataset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_custom_dataset) | resource |
| [azurerm_data_factory_pipeline](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_pipeline) | resource |
| [azurerm_data_factory_trigger_schedule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_trigger_schedule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_locationname"></a> [locationname](#input\_locationname) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_resourcegroupname"></a> [resourcegroupname](#input\_resourcegroupname) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_sql_db_server"></a> [sql\_db\_server](#input\_sql\_db\_server) | n/a | `string` | n/a | yes |
| <a name="input_primary_blob_connection_string"></a> [primary\_blob\_connection\_string](#input\_primary\_blob\_connection\_string) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_id"></a> [data_factory_id](#output\_data\_factory\_id) | n/a |
| <a name="output_data_factory_name"></a> [data_factory_name](#output\_data\_factory\_name) | n/a |
