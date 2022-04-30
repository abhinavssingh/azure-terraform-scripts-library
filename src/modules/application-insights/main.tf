resource "azurerm_application_insights" "appinsights" {
  name                = "${var.environment}-ai-${var.locationname}-${var.project}-appinsight"
  location            = var.location
  resource_group_name = var.resourcegroupname
  application_type    = "web"
  tags = var.tags
}