/* //VM 갯수
variable "vm_count" {
  type = number
  default = 2
} */

// 윈도우 vm 생성
//언더바 사용 불가
resource "azurerm_windows_virtual_machine" "CDH-VM" {
 //count                 = var.vm_count
  name                = "CDH-VM"
  resource_group_name = azurerm_resource_group.CDH-RG.name
  location            = azurerm_resource_group.CDH-RG.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.CDH-NI.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

/* 
//리눅스
resource "azurerm_virtual_machine" "CDH-VM" {
  count                 = var.vm_count
  name                  = "CDH-VM${count.index + 1}"
  location              = azurerm_resource_group.CDH-RG.location
  resource_group_name   = azurerm_resource_group.CDH-RG.name
  network_interface_ids = [azurerm_network_interface.CDH-NI[count.index].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  //OS DISK
  storage_os_disk {
    name              = "CDH-VM${count.index +1}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "CDH-VM${count.index +1}"
    admin_username = "adminuser"
    admin_password = "Password1234!"
       
  }
   os_profile_linux_config {
      disable_password_authentication = false
  }
} */