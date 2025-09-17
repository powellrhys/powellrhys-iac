output "sql_server_password" {
  value     = random_password.admin_password.result
  sensitive = true
}

output "sql_server_username" {
  value = azurerm_mssql_server.sql_server.administrator_login
}

output "sql_server_name" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_server_databases" {
  value = [for db in azurerm_mssql_database.sql_database : db.name]
}
