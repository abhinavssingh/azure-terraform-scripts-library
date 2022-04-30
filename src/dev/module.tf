# Locals
locals {
  tags = {
    "environment type"     = "Dev"
    "cost center" = "<123456>" // enter your cost center. Add tags as per your standards
  }

  # here we have followed specific naming convention in rersource creation but you will have own conventions so define variable as per your requirement.
  # you can remove variables what's not required in your scope
  environment    = "dev"
  project ="terraform"
  locationname = "usa"
  location = "eastus"
  subscription_id = "enter your subscription id"
  enterprise_application_object_id = "enter object id to whom you want to grant access" // service principal object id
  azure_management_hostname = "https://management.azure.com"

}

# here you will provide the reference your all modules what you want to create in azure
# Resource Group
module "cmgi_rg" {
  source      = "../modules/resource-group"
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
}

# Role Assignment
module "cmgi_role_assignment" {
   source      = "../modules/role-assignment"
   resourcegroupid = module.cmgi_rg.resource_group_id
   service_principle_id = local.enterprise_application_object_id
}

# Storage Account
module "cmgi_storage_account" {
  source = "../modules/storage-account"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
}

# Application Insights
module "cmgi_appinsights" {
  source      = "../modules/application-insights"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
}

# Logic App
module "cmgi_logic_app" {
  source      = "../modules/logic-app"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
}

# Function App
module "cmgi_function_app" {
  source      = "../modules/function-app"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
  storageaccountname = module.cmgi_storage_account.storage_account_name
  storageaccountaccesskey = module.cmgi_storage_account.storage_account_primary_access_key
  appinsight_key = module.cmgi_appinsights.appinsights_instrumentation_key
  appinsight_connection_string = module.cmgi_appinsights.appinsights_connection_string
}

# API Management
module "cmgi_apimgmt" {
  source      = "../modules/api-management"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
  subscription_id = local.subscription_id
  appinsight_id = module.cmgi_appinsights.appinsights_id
  appinsight_name = module.cmgi_appinsights.appinsights_name
  appinsight_key = module.cmgi_appinsights.appinsights_instrumentation_key
  function_app_name = module.cmgi_function_app.function_app_name
  azure_mgmt_url = local.azure_management_hostname
}

# Key Vault
module "cmgi_key_vault" {
  source      = "../modules/key-vault"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
  object_id = local.enterprise_application_object_id
  functionapp_object_id = module.cmgi_function_app.function_app_principle_id // object id when you turned on System identity. This will be used to grant access policy.
}

# SQL Server
module "cmgi_sql_server" {
  source      = "../modules/sql-server"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
  blob_endpoint = module.cmgi_storage_account.storage_account_primary_blob_endpoint
  sa_primary_access_key = module.cmgi_storage_account.storage_account_primary_access_key
}

# Data Factory
module "cmgi_data_factory" {
  source      = "../modules/data-factory"
  resourcegroupname = module.cmgi_rg.resource_group_name
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
  primary_blob_connection_string = module.cmgi_storage_account.storage_account_primary_connection_string
  function_app_1_name = module.cmgi_function_app.function_app_name
  sql_db_server = module.cmgi_sql_server.sql_server_url
  logic_app_1_access_endpoint = module.cmgi_logic_app.logic_app_ae
  EmailTo = "abhinav.singh2@publicissapient.com"
}