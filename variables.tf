variable "app_service_sku" {
  description = "The SKU for the app service plan. Valid values are B1-B3 (basic), P1v2-P3v3 (premium), Y1 & EP1-EP3 (consumption)."
}

variable "app_settings" {
  description = "App setting/environment variables for the function app."
}

variable "backend_client_secret" {
  description = "The secret of the backend app registration representing the function app."
}

variable "backend_client_id" {
  description = "The client id of the backend app registration representing the function app."
}

variable "location" {
  description = "The location resources are created in."
}

variable "project" {
  description = "The name or short hand of the project resources are being created for."
}

variable "resource_group" {
  description = "The resource group to deploy the function app to."
}

variable "storage_account_tier" {
  description = "The tier of the storage account to use. Valid options are Standard and Premium. Defaults to Standard."
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "The replication type to use for the storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Defaults to LRS."
  default     = "LRS"
}

variable "tags" {
  description = "Tags associated with the resources."
}

variable "unique_id" {
  description = "A unique identifier for the function app to use. Usually includes some acronym for the project."
}
