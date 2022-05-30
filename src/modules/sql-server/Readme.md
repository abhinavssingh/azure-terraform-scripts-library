# Overview

Terraform module to generate Azure MS Sql Server.

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
| [azurerm_mssql_server.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_locationname"></a> [locationname](#input\_locationname) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_resourcegroupname"></a> [resourcegroupname](#input\_resourcegroupname) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_blob_endpoint"></a> [blob\_endpoint](#input\_blob\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_sa_primary_access_key"></a> [sa\_primary\_access\_key](#input\_sa\_primary\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | n/a |
| <a name="output_sql_server_name"></a> [sql\_server\_name](#output\_sql\_server\_name) | n/a |
| <a name="output_sql_server_url"></a> [sql\_server\_url](#output\_sql_server_url) | n/a |
