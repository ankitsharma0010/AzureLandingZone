module "ResourceGroup" {
  source         = "../../ResourceGroup"
  Resource_Group = var.Resource_Group
}
module "VirtualNetwork" {
  source          = "../../VirtualNetwork"
  Virtual_Network = var.Virtual_Network
  depends_on      = [module.ResourceGroup]
}
module "Subnet" {
  source     = "../../Subnet"
  Subnet     = var.Subnet
  depends_on = [module.VirtualNetwork]
}
module "KeyVault" {
  source     = "../../KeyVault"
  KeyVault   = var.KeyVault
  depends_on = [module.Subnet]
}
module "VM" {
  source     = "../../VM"
  VM         = var.VM
  depends_on = [module.KeyVault]
}
module "Bastion" {
  source     = "../../Bastion"
  Bastion    = var.Bastion
  depends_on = [module.VM]
}
