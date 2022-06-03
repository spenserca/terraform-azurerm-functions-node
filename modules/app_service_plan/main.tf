variable "project" {}
variable "location" {}
variable "resource_group" {}
variable "app_service_sku" {}
variable "tags" {}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "plan-${var.project}"
  location            = var.location
  resource_group_name = var.resource_group

  os_type  = "Windows"
  sku_name = var.app_service_sku

  tags = var.tags
}
