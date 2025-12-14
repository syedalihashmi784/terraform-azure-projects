
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.1.0"
    }
  }

  #   backend "azurerm" {
  #     resource_group_name  = "tfstatefile-rg"
  #     storage_account_name = "<storage_account_name>"
  #     container_name       = "tfstateblob"
  #     key                  = "terraform.tfstate"
  #   }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

  # Azure for Students subscription
  #Use command az login to login and get subscription ID
  # Use command az account show to show the subscription ID
  subscription_id = "ENTER_YOUR_SUBSCRIPTION_ID_HERE"
}

resource "azurerm_resource_group" "project101-rg" { #alias for resource group
  name     = "project101-rg"                        #name of the resource group
  location = "Canada Central"
}

resource "azurerm_storage_account" "project101" {
  name                     = "project101" #name of the storage account -- must be globally unique
  resource_group_name      = azurerm_resource_group.project101-rg.name
  location                 = azurerm_resource_group.project101-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
