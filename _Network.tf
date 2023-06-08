//가상네트워크
resource "azurerm_virtual_network" "CDH-VN" {
  name                = "CDH-VN"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.CDH-RG.location
  resource_group_name = azurerm_resource_group.CDH-RG.name
}

//서브넷
resource "azurerm_subnet" "CDH-SN" {
  name                 = "CDH-SN"
  resource_group_name  = azurerm_resource_group.CDH-RG.name
  virtual_network_name = azurerm_virtual_network.CDH-VN.name
  address_prefixes     = ["10.0.1.0/24"]
}


//네트워크 인터페이스
resource "azurerm_network_interface" "CDH-NI" {
 // count               = var.vm_count
  name                = "CDH-NI"
  location            = azurerm_resource_group.CDH-RG.location
  resource_group_name = azurerm_resource_group.CDH-RG.name

  ip_configuration {
    name                          = "CDH-NI-ipconfig"
    subnet_id                     = azurerm_subnet.CDH-SN.id
    private_ip_address_allocation = "Dynamic"
    private_ip_address = "10.0.1.10"
  }
}

//공용 IP
resource "azurerm_public_ip" "CDH-PIP" {
  name                = "CDH-PIP"
  location            = azurerm_resource_group.CDH-RG.location
  resource_group_name = azurerm_resource_group.CDH-RG.name
  allocation_method   = "Dynamic"
}

