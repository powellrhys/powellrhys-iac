module "storage_account" {
  source = "./modules/azure/storage_account"

  resource_group_name                 = "powellrhys-project-data-rg"
  storage_account_name                = "powellrhys-project-data"
  storage_account_location            = "westeurope"
}
