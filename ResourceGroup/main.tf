variable "Resource_Group" {

}
resource "azurerm_resource_group" "ResourceGroup" {
  for_each = var.Resource_Group
  name     = each.value.resource_group_name
  location = each.value.location
}