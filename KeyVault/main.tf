variable "KeyVault" {

}
resource "azurerm_key_vault" "KeyVault" {
  for_each                    = var.KeyVault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.tenant.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.tenant.tenant_id
    object_id = data.azuread_user.object.object_id

     key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set"
    ]

    storage_permissions = [
      "Get",
    ]

  }
}
resource "random_string" "username_credentials" {
  length  = 10
  special = false
}

resource "random_password" "password_credentials" {
  length           = 15
  special          = true
  override_special = "!@#$%&*()-_=+[]{}|;:/?,.<>"
}

resource "azurerm_key_vault_secret" "username" {
  for_each = var.KeyVault
  name         = "username"
  value        = random_string.username_credentials.result
  key_vault_id = azurerm_key_vault.KeyVault[each.key].id
}

resource "azurerm_key_vault_secret" "password" {
  for_each = var.KeyVault
  name         = "password"
  value        = random_password.password_credentials.result
  key_vault_id = azurerm_key_vault.KeyVault[each.key].id
}