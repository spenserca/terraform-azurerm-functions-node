variable "app_insights_key" {}
variable "app_settings" {}
variable "backend_client_id" {}
variable "backend_client_secret" {}
variable "location" {}
variable "resource_group" {}
variable "service_plan_id" {}
variable "tags" {}
variable "unique_id" {}
variable "storage_account" {}

resource "azurerm_windows_function_app" "function_app" {
  location            = var.location
  name                = "func-${var.unique_id}"
  resource_group_name = var.resource_group
  service_plan_id     = var.service_plan_id

  site_config {
    always_on                = true
    application_insights_key = var.app_insights_key

    application_stack {
      node_version = 14
    }

    cors {
      allowed_origins = ["*"]
    }
  }

  app_settings = var.app_settings

  auth_settings {
    enabled = true
    active_directory = {
      client_id     = var.backend_client_id
      client_secret = var.backend_client_secret
    }
    default_provider              = "AzureActiveDirectory"
    unauthenticated_client_action = "RedirectToLoginPage"
  }

  functions_extension_version = "~4"
  https_only                  = true

  identity {
    type = "SystemAssigned"
  }

  storage_account_name          = var.storage_account
  storage_uses_managed_identity = true
  tags                          = var.tags
}
