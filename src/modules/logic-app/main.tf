resource "azurerm_logic_app_workflow" "logicapp" {
  name                    = "${var.environment}-la-${var.locationname}-${var.project}-logicapp"
  resource_group_name     = var.resourcegroupname
  location                = var.location 
  tags = var.tags
}

resource "azurerm_logic_app_trigger_http_request" "trigger" {
  name         = "When a HTTP Request is Received"
  logic_app_id = azurerm_logic_app_workflow.logicapp.id
  schema = <<SCHEMA
{
                        "type": "object",
                        "properties": {
                            "BodyText": {
                                "type": "string"
                            },
                            "BodyTextFilter": {
                                "type": "string"
                            },
                            "FileName": {
                                "type": "string"
                            },
                            "SubjectName": {
                                "type": "string"
                            }
                            }
}
SCHEMA
}

resource "azurerm_logic_app_action_custom" "action1" {
  name         = "Create_Request_URL_Variable"
  logic_app_id = azurerm_logic_app_workflow.logicapp.id
  body = <<BODY
{
    "description": "Create_Request_URL_Variable",
    "inputs": {
                    "variables": [
                        {
                            "name": "reportURL",
                            "type": "string"
                        }
                    ]
                },
                "runAfter": {},
                "type": "InitializeVariable"
}
BODY
}

resource "azurerm_logic_app_action_custom" "action2" {
  name         = "Create_Email_Subject_Variable"
  logic_app_id = azurerm_logic_app_workflow.logicapp.id
  depends_on   = [azurerm_logic_app_action_custom.action1]
  body = <<BODY
{
    "description": "Create Email Subject Variable",
    "inputs": {
                    "variables": [
                        {
                            "name": "emailSubject",
                            "type": "string",
                            "value": "@triggerBody()?['SubjectName']"
                        }
                    ]
                },
                "runAfter": {
                    "Create_Request_URL_Variable": [ 
                        "Succeeded"
                    ]
                },
                "type": "InitializeVariable"
}
BODY
}
