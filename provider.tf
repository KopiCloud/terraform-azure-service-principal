# -----------------------
# Azure Provider - Main #
# -----------------------

# Define Terraform provider
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

# Define Azure AD provider
provider "azuread" {
  client_id       = var.aad_client_id
  client_secret   = var.aad_client_secret
  tenant_id       = var.aad_tenant_id
}

# Define Azure provider
provider "azurerm" {
  client_id       = var.aad_client_id
  client_secret   = var.aad_client_secret
  tenant_id       = var.aad_tenant_id
  subscription_id = var.aad_subscription_id
  features {}
}
