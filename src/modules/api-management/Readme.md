# Overview

Terraform module to generate Azure API Management.

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
| [azurerm_api_management.apimgmt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |
| [azurerm_api_management_logger.logger](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_logger) | resource |
| [azurerm_api_management_diagnostic.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_diagnostic) | resource |
| [azurerm_api_management_api.api1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api_policy.api1policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_diagnostic.api1diag1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_diagnostic) | resource |
| [azurerm_api_management_api_operation.api1op1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation) | resource |
| [azurerm_api_management_api_operation_policy.api1op1policy1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy) | resource |
| [azurerm_api_management_named_value.namedvalue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_named_value) | resource |
| [azurerm_api_management_backend.apibackend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_backend) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_locationname"></a> [locationname](#input\_locationname) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_resourcegroupname"></a> [resourcegroupname](#input\_resourcegroupname) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscrption\_id) | n/a | `string` | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_appinsight_id"></a> [appinsight\_id](#input\_appinsight\_id) | n/a | `string` | n/a | yes |
| <a name="input_appinsight_name"></a> [appinsight\_name](#input\_appinsight\_name) | n/a | `string` | n/a | yes |
| <a name="input_appinsight_key"></a> [appinsight\_key](#input\_appinsight\_key) | n/a | `string` | n/a | yes |
| <a name="input_azure_mgmt_url"></a> [azure\_mgmt\_url](#input\_azure\_mgmt\_url) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apimgmt_id"></a> [apimgmt\_id](#output\_apimgmt\_id) | n/a |
| <a name="output_apimgmt_name"></a> [apimgmt\_name](#output\_apimgmt\_name) | n/a |
