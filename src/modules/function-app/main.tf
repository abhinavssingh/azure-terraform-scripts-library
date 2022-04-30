resource "azurerm_service_plan" "appplan" {
  name                = "${var.environment}-asp-${var.locationname}-${var.project}-appplan"
  location            = var.location
  resource_group_name = var.resourcegroupname
  os_type             = "Windows" // specify function app type
  sku_name            = "Y1" // specify procing tier
  tags = var.tags
}

resource "azurerm_windows_function_app" "functionapp" {
  name                = "${var.environment}-fa-${var.locationname}-${var.project}-functionapp"
  location            = var.location
  resource_group_name = var.resourcegroupname
  service_plan_id         = azurerm_service_plan.appplan.id
  storage_account_name       = var.storageaccountname
  storage_account_access_key = var.storageaccountaccesskey
  client_certificate_mode = "Required"
  tags = var.tags
  functions_extension_version = "~1" // specify runtime extension verion
  https_only = true
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet" // specify runtime environment
    "WEBSITE_RUN_FROM_PACKAGE" = 1
    "FUNCTION_APP_EDIT_MODE" = "readwrite"
  }
  site_config{
    application_insights_connection_string = var.appinsight_connection_string
    application_insights_key = var.appinsight_key
    elastic_instance_minimum = 1
  }
  # below block enables identity on fucntion app means you can connect your function app through key vault.
  # if you are enabling this, then you need to provide Key Vault Administrtor Role explicity to current user/service principle
  identity {
    type = "SystemAssigned"
  }
}