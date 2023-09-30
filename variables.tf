# ------------------------
# Authentication Variables
# ------------------------

variable "aad_tenant_id" {
  type        = string
  description = "The id of the Azure Tenant to which all subscriptions belong"
}

variable "aad_subscription_id" {
  type        = string
  description = "The id of the Azure Subscription"
}

variable "aad_client_id" {
  type        = string
  description = "The client id of the Service Principal for interacting with Azure resources"
}

variable "aad_client_secret" {
  type        = string
  description = "The client secret of the Service Principal for interacting with Azure resources"
  sensitive   = true
}

# -------------------
# Terraform Variables
# -------------------

variable "azure_service_principal_display_name" {
  description = "A display name for the Azure Active Directory (Azure AD) Service Principal."
  type        = string
  default     = "Terraform Databricks"
}