# Locals
locals {
  tags = {
    "environment type"     = "Dev"
    "cost center" = "<enter your cost center>"
  }

  # here we have followed specific naming convention in rersource creation but you will have own conventions so define variable as per your requirement.
  environment    = "dv"
  project ="data"
  locationname = "usa"
  location = "eastus"

}

# here you will provide the reference your all modules what you want to create in azure
# Resource Group
module "cmgi_rg" {
  source      = "../modules/resource-group"
  location = local.location
  environment = local.environment
  project = local.project
  locationname = local.locationname
  tags = local.tags
}
