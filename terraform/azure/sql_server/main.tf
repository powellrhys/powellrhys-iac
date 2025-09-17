resource "azurerm_resource_group" "sql_server_rg" {
  name     = var.sql_server_resource_group_name
  location = var.sql_server_location
}

resource "time_rotating" "admin_password" {
  rotation_months = var.admin_password_rotation_months
}

resource "random_password" "admin_password" {
  length      = 20
  min_numeric = 2
  min_upper   = 2
  min_lower   = 2
  special     = false
  keepers = {
    time = time_rotating.admin_password.id
  }
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.sql_server_rg.name
  location                     = azurerm_resource_group.sql_server_rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = random_password.admin_password.result

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_database" "sql_database" {
  for_each   = toset(var.sql_server_database_names)
  name       = each.value
  server_id  = azurerm_mssql_server.sql_server.id

  # ✅ DTU-based Basic SKU, eligible for free tier
  sku_name    = "Basic"
  max_size_gb = 2
}
