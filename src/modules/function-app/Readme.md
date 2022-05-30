# Overview

Terraform module to generate Azure Windows Function App.

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
| [azurerm_windows_function_app.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_locationname"></a> [locationname](#input\_locationname) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_resourcegroupname"></a> [resourcegroupname](#input\_resourcegroupname) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_storageaccountname"></a> [storageaccountname](#input\_storageaccountnamey) | n/a | `string` | n/a | yes |
| <a name="input_storageaccountaccesskey"></a> [storageaccountaccesskey](#input\_storageaccountaccesskey) | n/a | `string` | n/a | yes |
| <a name="input_appinsight_key"></a> [appinsight\_key](#input\_appinsight\_key) | n/a | `string` | n/a | yes |
| <a name="input_appinsight_connection_string"></a> [appinsight\_connection\_string](#input\_appinsight\_connection\_string) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_app_id"></a> [function\_app\_id](#output\_function\_app\_id) | n/a |
| <a name="output_function_app_name"></a> [function\_app\_name](#output\_function\_app\_name) | n/a |
| <a name="output_function_app_principle_id"></a> [function\_app\_principle\_id](#output\_function\_app\_principle\_id) | n/a |
