# variables.tf

variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"

  default = "staging"

  validation {
    condition     = length(var.environment) > 2
    error_message = "Environment name must be longer than 2 characters."
  }
}
variable "storage_account_name" {
  type        = list(string)
  default     = ["storageaccname20252", "storageaccname20252022"]
  description = "Names of the storage account for remote state for diff instances"
}


variable "allowed_locations" {
  type        = list(string)
  default     = ["Canada Central", "East US", "West Europe"]
  description = "List of allowed Azure regions for resource deployment"

}
variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed"
  default     = "Canada Central"

}
