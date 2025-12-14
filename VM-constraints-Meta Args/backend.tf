terraform {

  backend "azurerm" {
    resource_group_name  = "tfstate-vm-rg"
    storage_account_name = "tfstatevm21341"
    container_name       = "tfstate-vm"
    key                  = "dev.terraform.tfstate"
  }

}
