terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
    #client_id = "${var.clientid}"
    ##subscription_id ="${var.subscriptionid}"
    ## tenant_id = "${var.tenantid}"
    ##client_secret ="${var.clientsecret}"
    features {
      
    }
}

resource "azurerm_resource_group" "amatrg" {
    name = "amat"
    location = "Central Us"
    tags = {
        environment = "Dev"
    }
}

