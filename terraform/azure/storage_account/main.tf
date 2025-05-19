resource "azurerm_resource_group" "storage_account_rg" {
  name     = var.resource_group_name
  location = var.storage_account_location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.storage_account_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  kind                     = "StorageV2"
  access_tier              = "Cool"
  enable_https_traffic_only = true      
}
