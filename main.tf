terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.21.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  tenant_id       = var.ARM_TENANT_ID
  subscription_id = var.ARM_SUBSCRIPTION_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
}

module "app_service_plan" {
  source          = "./modules/app_service_plan"
  app_service_sku = var.app_service_sku
  location        = var.location
  project         = var.project
  resource_group  = var.resource_group
  tags            = var.tags
}

module "storage_account" {
  source                           = "./modules/storage_account"
  location                         = var.location
  resource_group                   = var.resource_group
  storage_account_replication_type = var.storage_account_replication_type
  storage_account_tier             = var.storage_account_tier
  unique_id                        = var.unique_id
  tags                             = var.tags
}

module "app_insights" {
  source         = "./modules/app_insights"
  location       = var.location
  project        = var.project
  resource_group = var.resource_group
  tags           = var.tags
}

module "function_app" {
  source                            = "./modules/function_app"
  app_insights_key                  = module.app_insights.instrumentation_key
  app_settings                      = var.app_settings
  backend_client_id                 = var.backend_client_id
  backend_client_secret             = var.backend_client_secret
  location                          = var.location
  resource_group                    = var.resource_group
  service_plan_id                   = module.app_service_plan.id
  storage_account                   = module.storage_account.name
  storage_account_connection_string = module.storage_account.connection_string
  tags                              = var.tags
  tenant_id                         = var.ARM_TENANT_ID
  unique_id                         = var.unique_id
}
