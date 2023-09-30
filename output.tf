output "azure_client_id" {
  description = "The Azure AD Service Principal's Application (Client) ID."
  value       = azuread_application.this.application_id
}

output "azure_client_secret" {
  description = "The Azure AD Service Principal's Client Secret Value."
  value       = nonsensitive(azuread_service_principal_password.this.value)
}
