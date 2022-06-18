terraform {
  backend "azurerm" {
    resource_group_name  = "tfm-azure-functions-node"
    storage_account_name = "scatfazfuncnode"
    container_name       = "tfstate"
    key                  = "prod.terraform.state"
  }
}
