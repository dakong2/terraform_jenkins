//보안그룹
resource "azurerm_network_security_group" "CDH_NSG" {
  name                = "CDH_NSG"
  location            = azurerm_resource_group.CDH-RG.location
  resource_group_name = azurerm_resource_group.CDH-RG.name



  /* tags = {
    environment = "Production"
  } */
}

resource "azurerm_network_security_rule" "CDH_NSGR" {
  name                        = "Wemade_office"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.CDH-RG.name
  network_security_group_name = azurerm_network_security_group.CDH_NSG.name
}

/* 
//ssh key (리눅스)
resource "azurerm_ssh_public_key" "example" {
  name                = "example"
  resource_group_name = "example"
  location            = "West Europe"
  public_key          = file("~/.ssh/id_rsa.pub")
} */