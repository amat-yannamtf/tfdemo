terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.39.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.31.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# terraform {
#   backend "s3" {
#     bucket = "amats3tfstates"
#     key    = "activity2.tfstate"
#     region = "us-west-2"
#     dynamodb_table = "amattflocking"
#   }
# }


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

provider "null" {
  
}