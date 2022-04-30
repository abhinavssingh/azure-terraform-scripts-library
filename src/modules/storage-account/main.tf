resource "azurerm_storage_account" "sa" {
  name                     = "${var.environment}sa${var.locationname}${var.project}storageact" // name doesn't accept special character and maximum limit is 24 character
  resource_group_name      = var.resourcegroupname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS" // specify replication strategy a sper your requirement
  tags = var.tags
}

# we can create thre types of container private/blob/container
 resource "azurerm_storage_container" "container-1" {
   name                  = "${var.environment}sa${var.locationname}${var.project}cont1" // all character should be small only
   storage_account_name  = azurerm_storage_account.sa.name
   container_access_type = "private"
 }

 resource "azurerm_storage_container" "container-1" {
   name                  = "${var.environment}sa${var.locationname}${var.project}cont2"
   storage_account_name  = azurerm_storage_account.sa.name
   container_access_type = "blob"
 }
