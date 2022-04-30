# generic
variable "project" {
  type = string
  description = "Project name"
}

variable "environment" {
  type = string
  description = "Environment (sandbox-sb/dev / qa / prod)"
}

variable "location" {
  type = string
  description = "Azure region, east us-usa, east us2 - us2"
}

variable "tags" {
}

variable "locationname" {
  type = string
  description = "abbrevation for location , east us-usa, east us2 - us2"
}

variable "resourcegroupname" {
  type = string
  description = "resource group name"
}

variable "appinsight_connection_string" {
  type = string
  description = "connection string of application insight"
}

variable "appinsight_key" {
  type = string
  description = "instrumentation key of application insight"
}

variable "storageaccountname" {
  type = string
  description = "storage account name"
}

variable "storageaccountaccesskey" {
  type = string
  description = "primary access key of storage account"
}