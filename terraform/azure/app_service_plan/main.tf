
resource "azurerm_resource_group" "service_plan_rg" {
    name     = var.resource_group_name
    location = var.app_service_plan_location
}

resource "azurerm_service_plan" "app_service_plan" {
    depends_on          = [azurerm_resource_group.service_plan_rg]
    name                = var.app_service_plan_name
    resource_group_name = azurerm_resource_group.service_plan_rg.name
    location            = azurerm_resource_group.service_plan_rg.location
    os_type             = var.os_type
    sku_name            = "F1"
}
