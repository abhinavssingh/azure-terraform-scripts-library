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

variable "archive_blob_connection_string" {
  type = string
  description = "connection string of archive storage account"
}

variable "EmailTo" {
  type = string
  description = " to whom failure email notification sent"
}

variable "primary_blob_connection_string" {
  type = string
  description = "connection string of primary storage account"
}

variable "function_app_1_name" {
  type = string
  description = "function app 1 name"
}

variable "sql_db_server" {
  type = string
  description = "sql server url"
}

variable "logic_app_1_access_endpoint" {
  type = string
  description = "access enapont of logic app 1"
}

variable "logic_app_2_access_endpoint" {
  type = string
  description = "access endpoint of logic app 2"
}