variable "resource_group" {}
variable "location" {}
variable "storage_account_tier" {}
variable "storage_account_replication_type" {}
variable "unique_id" {}
variable "tags" {}

locals {
  unique_hash = sha256(var.unique_id)
}

resource "azurerm_storage_account" "storage_account" {
  name                      = "st${substr(local.unique_hash, 0, 22)}"
  resource_group_name       = var.resource_group
  location                  = var.location
  account_replication_type  = var.storage_account_replication_type
  account_tier              = var.storage_account_tier
  enable_https_traffic_only = true
  tags                      = var.tags
}

output "name" {
  value = azurerm_storage_account.storage_account.name
}

output "connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}
