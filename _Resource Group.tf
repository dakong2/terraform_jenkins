//리소스 그룹
resource "azurerm_resource_group" "CDH-RG" {
  name     = "CDH-RG"
  location = "KoreaCentral"
}