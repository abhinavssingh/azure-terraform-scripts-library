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

variable "subscription_id" {
  type = string
  description = "subscription id of current environment/resource group "
}

variable "function_app_name" {
  type = string
  description = "name of function app"
}


variable "appinsight_id" {
  type = string
  description = "application insight id of application insight"
}

variable "appinsight_name" {
  type = string
  description = "name of application management app insight"
}

variable "appinsight_key" {
  type = string
  description = "instrumentation key of application insight"
}

variable "azure_mgmt_url" {
  type = string
  description = "azure management host name"
}