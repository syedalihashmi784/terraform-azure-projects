variable "environment" {
  type        = string
  description = "The environment for the resources"
  default     = "dev"
}

variable "size" {
  type        = number
  description = "storagae disk size"
  default     = 30
}

variable "is_delete" {
  type        = bool
  description = "Flag to delete OS disk on VM termination"
  #change to false if critical operations running on vm
  default = true

}

variable "allowed_locations" {
  type        = list(string)
  default     = ["Canada Central", "East US", "West Europe"]
  description = "List of allowed Azure regions for resource deployment"

}
