###########################
## Resource Group
###########################

resource "azurerm_resource_group" "rg" {
  name      = "${var.environment}-rg-${var.locationname}-cp-${var.project}-resourcegrp"
  location  = var.location
  tags = var.tags
}