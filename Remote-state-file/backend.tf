terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-canada"
    storage_account_name = "tfstatecanada30012"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
