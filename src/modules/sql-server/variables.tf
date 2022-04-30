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

variable "blob_endpoint" {
  type = string
  description = "primary blob endpoint of linked storage account"
}

variable "sa_primary_access_key" {
  type = string
  description = "primary access key of linked storage account"
}