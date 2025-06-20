module "storage_account" {
    source = "../terraform/azure/storage_account"

    resource_group_name      = "powellrhys-project-data-rg"
    storage_account_name     = "powellrhysdata"
    storage_account_location = var.location
    storage_containers = [
        "play-cricket",
        "strava"
    ]
}

module "app_service_plan" {
  source = "../terraform/azure/app_service_plan"

    resource_group_name       = "powellrhys-app-service-plan-rg"
    app_service_plan_name     = "applications"
    app_service_plan_location = var.location
    os_type = "Linux"
}
