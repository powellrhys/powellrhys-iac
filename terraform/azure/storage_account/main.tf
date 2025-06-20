resource "azurerm_resource_group" "storage_account_rg" {
    name     = var.resource_group_name
    location = var.storage_account_location
}

resource "azurerm_storage_account" "storage_account" {
    depends_on               = [azurerm_resource_group.storage_account_rg]
    name                     = var.storage_account_name
    resource_group_name      = azurerm_resource_group.storage_account_rg.name
    location                 = azurerm_resource_group.storage_account_rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
    enable_https_traffic_only = true

    depends_on = [
      azurerm_resource_group.storage_account_rg
    ]
}

resource "azurerm_storage_container" "containers" {
    depends_on            = [azurerm_storage_account.storage_account]
    for_each              = toset(var.storage_containers)
    name                  = each.value
    storage_account_name  = azurerm_storage_account.storage_account.name
    container_access_type = "private"

    depends_on = [
      azurerm_storage_account.storage_account
    ]
}
