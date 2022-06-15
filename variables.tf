variable "app_service_sku" {
  description = "The SKU for the app service plan. Valid values are B1-B3 (basic), P1v2-P3v3 (premium), Y1 & EP1-EP3 (consumption)."
  validation {
    condition = contains([
      "B1", "B2", "B3", "D1", "F1", "FREE", "I1", "I2", "I3", "I1v2", "I2v2", "I3v2", "P1v2", "P2v2", "P3v2", "P1v3",
      "P2v3", "P3v3", "S1", "S2", "S3", "SHARED", "Y1", "EP1", "EP2", "EP3", "WSI", "WS2", "WS3"
    ], var.app_service_sku)
    error_message = "Service plan sku must be a valid option"
  }
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
  description = "The replication type to use for the storage account. Defaults to LRS."
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.storage_account_replication_type)
    error_message = "Storage account replication type must be a valid option (LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS)"
  }
}

variable "tags" {
  description = "Tags associated with the resources."
}

variable "unique_id" {
  description = "A unique identifier for the function app to use. Usually includes some acronym for the project."
}
