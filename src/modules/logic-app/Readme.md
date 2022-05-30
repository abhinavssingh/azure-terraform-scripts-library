# Overview

Terraform module to generate Azure Logic App.

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
| [azurerm_logic_app_workflow.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_workflow) | resource |
| [azurerm_logic_app_trigger_http_request](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_trigger_http_request) | resource |
| [azurerm_logic_app_action_custom](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_action_custom) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_locationname"></a> [locationname](#input\_locationname) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_resourcegroupname"></a> [resourcegroupname](#input\_resourcegroupname) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logic_app_id"></a> [logic\_app\_id](#output\_logic\_app\_id) | n/a |
| <a name="output_logic_app_name"></a> [logic\_app\_name](#output\_logic\_app\_name) | n/a |
| <a name="output_logic_app_weia"></a> [logic\_app\_weia](#output\_logic\_app\_weia) | n/a |
| <a name="output_logic_app_ae"></a> [logic\_app\_ae](#output\_logic\_app\_ae) | n/a |
| <a name="output_logic_app_ceip"></a> [logic\_app\_ceip](#output\_logic\_app\_ceip) | n/a |
