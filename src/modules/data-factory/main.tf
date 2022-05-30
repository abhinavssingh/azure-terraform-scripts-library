resource "azurerm_data_factory" "adf" {
  name                    = "${var.environment}-df-${var.locationname}-${var.project}-inbound-datafactory"
  resource_group_name     = var.resourcegroupname
  location                = var.location 
  public_network_enabled  = true
  tags = var.tags
  vsts_configuration {
   account_name     = "testdevops"
   branch_name      = "main"
   project_name = "demodatafactory"
   repository_name  = "${var.environment}-datafactory-inbound-library"
   root_folder      = "/"
   tenant_id = "<enter your tenant id>"
  }
}

resource "azurerm_data_factory_integration_runtime_azure" "integrationruntime" {
  name            = "AutoResolveIntegrationRuntime"
  data_factory_id = azurerm_data_factory.adf.id
  location        = "AutoResolve"
  compute_type = "General"
  core_count = 8
}

# linked service type of azure blob storage
resource "azurerm_data_factory_linked_service_azure_blob_storage" "linkedService1" {
  name              = "linkedservice1"
  data_factory_id   = azurerm_data_factory.adf.id
  description = "Demo Blob Storage Connection"
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.integrationruntime.name
  connection_string = var.primary_blob_connection_string
}

# linked service type of azure function app
resource "azurerm_data_factory_linked_service_azure_function" "linkedService2" {
  name            = "linkedservice2"
  data_factory_id = azurerm_data_factory.adf.id
  description = "Demo Function App Connection"
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.integrationruntime.name
  url             = "https://${var.function_app_name}.net"
  key = "_master"
}

# linked service type of azure sql database
resource "azurerm_data_factory_linked_service_azure_sql_database" "linkedService3" {
  name              = "linkedService3"
  data_factory_id   = azurerm_data_factory.adf.id
  description = "Demo Azure SQL Database Connection"
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.integrationruntime.name
  connection_string = "<enter sql connection string>"
}

# linked service type of azure sql server
resource "azurerm_data_factory_linked_service_sql_server" "linkedService4" {
  name              = "linkedService4"
  data_factory_id   = azurerm_data_factory.adf.id
  description = "Demo Azure SQL Server Connection"
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.integrationruntime.name
  connection_string = "<Enter sql connection string>"
}

resource "azurerm_data_factory_dataset_delimited_text" "dataset1" {
  name                = "Demo Blob Storage Dataset"
  data_factory_id     = azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.linkedService1.name
  column_delimiter    = ","
  encoding            = "UTF-8"
  quote_character     = "\""
  escape_character    = "\""
  first_row_as_header = true
  null_value          = "NULL"
  parameters = {
    "p_ds_archivefile_containername" = "dmeo"
    "p_ds_archivefilepath_in_container" = "demodatafactory"
    "p_ds_archivefile_name" = ""
  }
  azure_blob_storage_location {
    filename = "@dataset().p_ds_file_name"
    path = "@dataset().p_ds_filepath_in_container"
    container = "@dataset().p_ds_afile_containername"
  }
}

resource "azurerm_data_factory_custom_dataset" "dataset2" {
  name                = "Demo Azure SQL Table Dataset"
  data_factory_id     = azurerm_data_factory.adf.id
  type = "AzureSqlTable"
  linked_service {
    name = azurerm_data_factory_linked_service_azure_sql_database.linkedService3.name
  }
  parameters = {
    "SCHEMA_NM" = ""
    "MAIN_TBL_NM" = ""
  }
  type_properties_json = <<JSON
            {
            "schema": {
                "value": "@dataset().SCHEMA_NM",
                "type": "Expression"
            },
            "table": {
                "value": "@dataset().MAIN_TBL_NM",
                "type": "Expression"
            }
        }
    JSON
    schema_json = <<JSON
{
}
JSON
}

resource "azurerm_data_factory_pipeline" "pipeline1" {
  name            = "demo_pipeline"
  data_factory_id = azurerm_data_factory.adf.id
  parameters = {
    "p_pl_inputfile_containername" = "container1"
    "p_pl_inputfilepath_container" = "Processed/demodatafactory"
    "p_pl_archivedays" = -401
    "p_pl_archivefile_containername" = "demo"
    "p_pl_archivefilepath_container" = "Processed/demodatafactory"
    "p_pl_enddays" = -120
    "p_pl_archive" = false
  }
  activities_json = <<JSON
    [
        
    ]
  JSON
}

resource "azurerm_data_factory_trigger_schedule" "trigger1" {
  name            = "Archive Trigger"
  description = "Archive Blob Container."
  data_factory_id = azurerm_data_factory.adf.id
  pipeline_name   = azurerm_data_factory_pipeline.pipeline1.name
  interval  = 1
  frequency = "Day"
  start_time = "2020-12-08T15:11:00+05:30"
  schedule { 
    minutes = [30]
    hours = [9]
  }
 pipeline_parameters = {
    "p_pl_log_source_paths"        = "Sample/Test"
    "p_pl_startdays"               = -30
    "p_pl_enddays"                 = -10
    "p_pl_inputfile_containername" = "container1"
    "p_pl_prestg_source_paths"     = "Test1,Test2"
 }
}
 