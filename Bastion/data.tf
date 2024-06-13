data "azurerm_subnet" "BastionSubnetID" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "ThalaVirtualNetwork"
  resource_group_name  = "ThalaRG"
}