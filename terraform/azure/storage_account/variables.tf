variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_account_name" {
  type        = string
  description = "Globally unique name for the storage account"
  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24 && can(regex("^[a-z0-9]+$", var.storage_account_name))
    error_message = "Storage account name must be 3-4 lowercase alphanumeric characters only."
  }
}

variable "storage_account_location" {
  description = "Storage Account Location"
  type        = string
}

variable "storage_containers" {
  description = "List of storage container names to create"
  type        = list(string)
  default     = []
}
