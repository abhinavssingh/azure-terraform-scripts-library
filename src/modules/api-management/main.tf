resource "azurerm_api_management" "apimgmt" {
  name                = "${var.environment}-am-${var.locationname}-${var.project}-apimgmt"
  location            = var.location 
  resource_group_name = var.resourcegroupname
  publisher_name      = "sample"
  publisher_email     = "test@test.com"
  sku_name = "Consumption_0" // select pricing tier as per here https://registry.terraform.io/providers/hashicorp/azurerm/3.0.2/docs/resources/api_management
   tags = var.tags
}

# connects api management with application insight 
resource "azurerm_api_management_logger" "logger" {
  name                = var.appinsight_name
  api_management_name = azurerm_api_management.apimgmt.name
  resource_group_name = var.resourcegroupname
  resource_id         = var.appinsight_id
  application_insights {
    instrumentation_key = var.appinsight_key
  }
}

# enable diagnostic and push data to application insight
resource "azurerm_api_management_diagnostic" "example" {
  identifier               = "applicationinsights"
  resource_group_name      = var.resourcegroupname
  api_management_name      = azurerm_api_management.apimgmt.name
  api_management_logger_id = azurerm_api_management_logger.logger.id
  sampling_percentage       = 5.0
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"
}

# below blocks creates those resources what we import through GUI as per here https://docs.microsoft.com/en-us/azure/api-management/import-function-app-as-api
# creation of API in api management interface
resource "azurerm_api_management_api" "api1" {
  name                = "demofunctionapp"
  description = "Demo Function App"
  resource_group_name = var.resourcegroupname
  api_management_name = azurerm_api_management.apimgmt.name
  revision = 1
  display_name = "Demo Function App"
  path = "Demo Function App"
  protocols           = ["https"]
  subscription_required = true
  subscription_key_parameter_names {
    header = "Ocp-Apim-Subscription-Key"
    query = "subscription-key"
  }
}

# assignment of policy
resource "azurerm_api_management_api_policy" "api1policy" {
  api_name            = azurerm_api_management_api.api1.name
  api_management_name = azurerm_api_management_api.api1.api_management_name
  resource_group_name = azurerm_api_management_api.api1.resource_group_name
  xml_content = <<XML
<policies>
    <inbound>
        <base />
        <set-backend-service id="apim-generated-policy" backend-id="demofunctionapp" />
        <set-query-parameter name="fileNames" exists-action="append">
            <value>@(context.Request.Url.Query.GetValueOrDefault("fileNames"))</value>
        </set-query-parameter>
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML
}

resource "azurerm_api_management_api_diagnostic" "api1diag1" {
  identifier               = "applicationinsights"
  resource_group_name      = var.resourcegroupname
  api_management_name      = azurerm_api_management.apimgmt.name
  api_name                 = azurerm_api_management_api.api1.name
  api_management_logger_id = azurerm_api_management_logger.logger.id
  sampling_percentage       = 100.0
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"
}

resource "azurerm_api_management_api_operation" "api1op1" {
  operation_id        = "TestFunction"
  api_name            = azurerm_api_management_api.api1.name
  api_management_name = azurerm_api_management.apimgmt.name
  resource_group_name = var.resourcegroupname
  display_name        = "TestFunction"
  method              = "GET"
  url_template        = "/TestFunction"
  description         = "Used to Convert file from excel to CSV"
  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "api1op1policy1" {
  api_name            = azurerm_api_management_api_operation.api1op1.api_name
  api_management_name = azurerm_api_management_api_operation.api1op1.api_management_name
  resource_group_name = azurerm_api_management_api_operation.api1op1.resource_group_name
  operation_id        = azurerm_api_management_api_operation.api1op1.operation_id
  xml_content = <<XML
<policies>
    <inbound>
        <base />
        <set-backend-service id="apim-generated-policy" backend-id="demofunctionapp" />
        <set-query-parameter name="filePath" exists-action="override">
            <value>@(context.Request.Url.Query.GetValueOrDefault("filePath"))</value>
        </set-query-parameter>
        <set-query-parameter name="outputPath" exists-action="override">
            <value>@(context.Request.Url.Query.GetValueOrDefault("outputPath"))</value>
        </set-query-parameter>
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML
}

# below block is required for authorizing backend api
resource "azurerm_api_management_named_value" "namedvalue" {
  name                = "${var.function_app_name}-key"
  resource_group_name = var.resourcegroupname
  api_management_name = azurerm_api_management.apimgmt.name
  display_name        = "${var.function_app_name}-key"
  value = "enter function app host key" // go to your fucntion --> create a new host key --> copy value of key
  secret = true
  tags = ["key","function","auto"]
}

resource "azurerm_api_management_backend" "apibackend" {
  name                = "demofunctionapp" // this will be the same name what you have provided in policy
  description = "Demo Function App"
  resource_group_name = var.resourcegroupname
  api_management_name = azurerm_api_management.apimgmt.name
  protocol            = "http"
  url                 = "https://${var.function_app_name}.azurewebsites.net/api"
  resource_id = "${var.azure_mgmt_url}/subscriptions/${var.subscription_id}/resourceGroups/${var.resourcegroupname}/providers/Microsoft.Web/sites/${var.function_app_name}"
  credentials {
    header = {
      "x-functions-key" = azurerm_api_management_named_value.namedvalue.value
    }
  }
}


