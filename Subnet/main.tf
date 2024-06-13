variable "Subnet" {

}

resource "azurerm_subnet" "Subnet" {
  for_each             = var.Subnet
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}