# Create the Azure Service Principal for Terraform

resource "azuread_application" "this" {
  display_name = var.azure_service_principal_display_name
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
}

resource "time_rotating" "month" {
  rotation_days = 30
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.object_id
  rotate_when_changed  = { rotation = time_rotating.month.id }
}

# Assign the Service Principal to the Subscription Owner Role

data "azurerm_subscription" "core" {}

resource "azurerm_role_assignment" "core" {
  scope = data.azurerm_subscription.core.id
  role_definition_name = "Owner"
  principal_id = azuread_service_principal.this.object_id
}

data "azurerm_subscription" "customer" {
  subscription_id = "complete-this"
}

resource "azurerm_role_assignment" "customer" {
  scope = data.azurerm_subscription.customer.id
  role_definition_name = "Owner"
  principal_id = azuread_service_principal.this.object_id
}
