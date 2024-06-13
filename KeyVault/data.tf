data "azurerm_client_config" "tenant" {

}
output "tenant" {
  value = data.azurerm_client_config.tenant.tenant_id
}
data "azuread_user" "object" {
  user_principal_name = "akshay@pksaws0908gmail.onmicrosoft.com"
}
output "object" {
  value = data.azuread_user.object.object_id
}

