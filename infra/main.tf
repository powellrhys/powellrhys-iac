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

module "powellrhys-sql-server" {
    source                         = "../terraform/azure/sql_server"

    sql_server_name                = "powellrhys-sql-server"
    sql_server_resource_group_name = "powellrhys-sql-server-rg"
    sql_server_location            = var.location
    admin_password_rotation_months = 6

    sql_server_database_names = [
        "fpl_database",
    ]
}
