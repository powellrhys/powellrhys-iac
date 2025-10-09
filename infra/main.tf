module "storage_account" {
    source = "../terraform/azure/storage_account"

    resource_group_name      = "powellrhys-project-data-rg"
    storage_account_name     = "powellrhysdata"
    storage_account_location = var.location
    storage_containers = [
        "play-cricket",
        "strava",
        "fantasy-premier-league",
        "golf",
        "project-monitoring"
    ]
}

module "app_service_plan" {
    source = "../terraform/azure/app_service_plan"

    resource_group_name       = "powellrhys-app-service-plan-rg"
    app_service_plan_name     = "applications"
    app_service_plan_location = var.location
    os_type = "Linux"
}

module "my_sql_server_no_db" {
  source = "./modules/sql_server"

  sql_server_resource_group_name = "powellrhys-sql-server-rg"
  sql_server_location            = "westeurope"
  sql_server_name                = "powellrhys-sqlserver"
  admin_password_rotation_months = 6
}
