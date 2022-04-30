resource "azurerm_role_assignment" "cmgi_rg_role" {
  scope                = var.resourcegroupid
  role_definition_name = "Contributor" // enter role name what you want to assign
  principal_id         = var.service_principle_id
}