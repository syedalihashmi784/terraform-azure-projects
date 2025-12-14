resource "azurerm_resource_group" "project-remote-statefile-rg" {

  lifecycle {
    create_before_destroy = true #minimize the downtime

    precondition {
      condition     = contains(var.allowed_locations, var.location)
      error_message = "The specified location is not in the list of allowed locations"
    }
  }
  name     = "projectremotestate2025205"
  location = var.location
}
