##################################
# Environment Specific Resources
##################################

##################
## Data Sources ##
##################

data "azuread_group" "dev_group_cmgi" {
  display_name = "<Enter your Azure AD Group of which user belongs>"
}

data "azurerm_client_config" "current" {}

######################
## Role Assignments ##
######################

resource "azurerm_role_assignment" "cmgi_rg_role" {
  scope                = module.cmgi_rg.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = data.azuread_group.dev_group_cmgi.object_id
}
