variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}

variable "app_service_plan_name" {
    type        = string
    description = "Globally unique name for the app service plan"
    validation {
        condition     = length(var.app_service_plan_name) >= 3 && length(var.app_service_plan_name) <= 24 && can(regex("^[a-z0-9]+$", var.app_service_plan_name))
        error_message = "App service plan name must be 3-4 lowercase alphanumeric characters only."
        }
}

variable "app_service_plan_location" {
    description = "App service plan Location"
    type        = string
}

variable "os_type" {
    description = "Operating system type of plan (either Linux or Windows)"
    type        = string
    validation {
        condition     = var.os_type == "Linux" || var.os_type == "Windows"
        error_message = "The input must be either 'Linux' or 'Windows'."
    }
}
