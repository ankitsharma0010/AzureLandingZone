data "azurerm_subnet" "Subnet_ID" {
  name                 = "ThalaSubnet"
  virtual_network_name = "ThalaVirtualNetwork"
  resource_group_name  = "ThalaRG"
}
data "azurerm_key_vault" "keyvault" {
  name                = "ThalaKeyVault"
  resource_group_name = "ThalaRG"
}
data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

