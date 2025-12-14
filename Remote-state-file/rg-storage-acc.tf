
# # Defining variable for environment
# variable "environment" {
#   description = "The environment for the resources"
#   type        = string
#   default     = "dev"

# }



resource "azurerm_storage_account" "project-remote-statefile" {

  lifecycle {
    create_before_destroy = true #minimize the downtime

    precondition {
      condition     = contains(var.allowed_locations, var.location)
      error_message = "The specified location is not in the list of allowed locations"
    }
  }


  # count                    = 2 #to create multiple instances if needed
  count = length(var.storage_account_name) #using length to count instances var


  name                     = var.storage_account_name[count.index] # 0 & 1
  resource_group_name      = azurerm_resource_group.project-remote-statefile-rg.name
  location                 = azurerm_resource_group.project-remote-statefile-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    # environment = var.environment
    environment = var.environment
  }
}


