module "storage_account" {
  source = "../terraform/azure/storage_account"

  resource_group_name                 = "powellrhys-project-data-rg"
  storage_account_name                = "powellrhysdata"
  storage_account_location            = "westeurope"
  storage_containers = [
    "play-cricket",
    "strava"
  ]
}
