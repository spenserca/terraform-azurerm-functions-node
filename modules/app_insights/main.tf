variable "project" {}
variable "location" {}
variable "resource_group" {}
variable "tags" {}

resource "azurerm_application_insights" "app_insights" {
  name                = "appi-${var.project}"
  location            = var.location
  resource_group_name = var.resource_group
  application_type    = "Node.JS"
  retention_in_days = 30
  tags = var.tags
}

output "instrumentation_key" {
  value = azurerm_application_insights.app_insights.instrumentation_key
}
