variable "Bastion" {

}
resource "azurerm_public_ip" "pip" {
  for_each            = var.Bastion
  name                = each.value.pipname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "Bastion_Host" {
  for_each            = var.Bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.BastionSubnetID.id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}