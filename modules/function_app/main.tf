variable "app_insights_key" {}
variable "app_settings" {}
variable "backend_client_id" {}
variable "backend_client_secret" {}
variable "location" {}
variable "resource_group" {}
variable "service_plan_id" {}
variable "storage_account" {}
variable "storage_account_connection_string" {}
variable "tags" {}
variable "tenant_id" {}
variable "unique_id" {}

locals {
  default_app_settings = {
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING = var.storage_account_connection_string
  }
  unique_hash = sha256(var.unique_id)
}

resource "azurerm_windows_function_app" "function_app" {
  location            = var.location
  name                = "func-${substr(local.unique_hash, 0, 19)}"
  resource_group_name = var.resource_group
  service_plan_id     = var.service_plan_id

  site_config {
    application_insights_key = var.app_insights_key

    application_stack {
      node_version = "~14"
    }

    cors {
      allowed_origins = ["*"]
    }
  }

  app_settings = merge(local.default_app_settings, var.app_settings)

  auth_settings {
    enabled         = true
    runtime_version = "~2"
    active_directory {
      allowed_audiences = [
        "api://${var.backend_client_id}"
      ]
      client_id     = var.backend_client_id
      client_secret = var.backend_client_secret
    }
    default_provider              = "AzureActiveDirectory"
    unauthenticated_client_action = "RedirectToLoginPage"
    issuer                        = "https://sts.windows.net/${var.tenant_id}/v2.0"
  }

  functions_extension_version = "~4"
  https_only                  = true

  identity {
    type = "SystemAssigned"
  }

  storage_account_name = var.storage_account
  tags                 = var.tags
}

output "backend_url" {
  value = "https://${azurerm_windows_function_app.function_app.default_hostname}"
}

output "managed_identity_principal_id" {
  value = azurerm_windows_function_app.function_app.identity.principal_id
}
