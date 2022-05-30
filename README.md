# Why Terraform Scripts are required?
[Infrastructure as code](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?in=terraform/azure-get-started)(IaC) is requirement of nowdays because clients want fully automation for deployment means code along with infrastructure resources.
We have so many cloud vendors but 3 cloud leading vendors are Azure, AWS and Google Cloud Platform (GCP). Each vendor has own template methodology to deploy resrources in cloud, it means that we can't use template of one providers for other providers. Due to change in features provided by Cloud Vendors, Clients use to change their platform time to time. So, we need a platform what could fulfill this bottleneck and [Terraform](https://www.terraform.io/) is the platform which helps to deploy resources in any Cloud platform.

## How Terraform Scripts Works?

Terraform script works in 5 steps:

1. Init : Initialize Terraform script.
2. Plan : Plan your script.
3. Validate : Validate your script.
4. Apply : Apply your script. Creates resources.
5. Destroy : Deletion of resources

```
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {

}

```

In above code snippet Terraform block is required in your first script because it invokes the required library from Hashicorp. Provider block sets global variable like Subscription and Service Principle.

I have followed module approach to create azure resources for better flexibilty. You can read more [here](https://www.terraform.io/language/modules/develop).

## Resources
1. [How to Get Started](https://learn.hashicorp.com/collections/terraform/azure-get-started)
2. [What is Azure Provider?](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
