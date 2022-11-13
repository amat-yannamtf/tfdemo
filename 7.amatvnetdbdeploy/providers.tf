terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.31.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  client_id = ""
  client_secret = ""
  tenant_id = ""
  subscription_id = ""
  features {}
}

provider "null" {
  
}

terraform {
  backend "azurerm" {
    resource_group_name  = "amatrg"
    storage_account_name = "amattfsa"
    container_name       = "tfstatefile"
    key                  = "amat.tfapply.tfstate"
  }
}