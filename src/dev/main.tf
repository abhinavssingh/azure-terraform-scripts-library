terraform {
  backend "azurerm" {
      subscription_id      = "<enter your subscription id>"
      resource_group_name  = "<enter your storage account resource group>"
      storage_account_name = "<enter your storage account name>"
      container_name       = "terraform"
      key                  = "<enter somestring>"
    }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.0.2"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.10.0"
    }
  }

  required_version = ">= 0.14.11"
}

provider "azurerm" {
  features {
    key_vault {
      recover_soft_deleted_key_vaults = false
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azuread" {
}
