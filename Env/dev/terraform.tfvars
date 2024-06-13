Resource_Group = {
  RG1 = {
    resource_group_name = "ThalaRG"
    location            = "westus2"
  }
}
Virtual_Network = {
  Vnet1 = {
    name                = "ThalaVirtualNetwork"
    location            = "canadaeast"
    resource_group_name = "ThalaRG"
  }
}
Subnet = {
  Subnet1 = {
    subnet_name          = "ThalaSubnet"
    resource_group_name  = "ThalaRG"
    virtual_network_name = "ThalaVirtualNetwork"
    address_prefixes     = ["10.0.1.0/24"]
  }
  Subnet2 = {
    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "ThalaRG"
    virtual_network_name = "ThalaVirtualNetwork"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
VM = {
  VM1 = {
    nic_name            = "ThalaNic"
    location            = "canadaeast"
    resource_group_name = "ThalaRG"
    vm_name             = "ThalaVM"
    vm_size             = "Standard_F2"

  }
}
KeyVault = {
  KeyVaultValue = {
    name                = "ThalaKeyVault"
    location            = "canadaeast"
    resource_group_name = "ThalaRG"
  }
}

Bastion = {
  AzureBastion = {
    pipname             = "ThalaPublicIP"
    location            = "canadaeast"
    resource_group_name = "ThalaRG"
    bastion_name        = "ThalaBastion"

  }
}