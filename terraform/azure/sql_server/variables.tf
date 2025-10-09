variable "sql_server_name" {
  description = "Name of SQL Server"
  type        = string
}

variable "sql_server_resource_group_name" {
  description = "Name of SQL Server Resource Group"
  type        = string
}

variable "sql_server_location" {
  description = "Location of SQL Server"
  type        = string
}

variable "sql_server_database_names" {
  type        = list(string)
  description = "List of SQL database names to create in the SQL server."
  default     = []
}

variable "admin_password_rotation_months" {
  description = "Rotation Period of SQL Server Password (months)"
  type        = string
  default     = 6
}
