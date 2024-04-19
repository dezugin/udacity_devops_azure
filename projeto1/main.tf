provider "azurerm" {
    features {}
  }
  
  resource "azurerm_virtual_network" "main" {
    name                = var.virtual_network_name
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = var.resource_group_name
  }
  
  resource "azurerm_subnet" "main" {
    name                 = var.subnet_name
    virtual_network_name = azurerm_virtual_network.main.name
    resource_group_name  = var.resource_group_name
    address_prefixes     = ["10.0.1.0/24"]
  }
  
  resource "azurerm_network_security_group" "main" {
    name                = var.nsg_name
    location            = var.location
    resource_group_name = var.resource_group_name
  
    security_rule {
      name                       = "allow_intra_vnet"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
  
    security_rule {
      name                       = "deny_internet"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }
  }
  
  resource "azurerm_subnet_network_security_group_association" "main" {
    subnet_id                 = azurerm_subnet.main.id
    network_security_group_id = azurerm_network_security_group.main.id
  }
  
  resource "azurerm_public_ip" "main" {
    name                = var.public_ip_name
    location            = var.location
    resource_group_name = var.resource_group_name
    allocation_method   = "Static"
  }
  
  resource "azurerm_lb" "main" {
    name                = var.lb_name
    location            = var.location
    resource_group_name = var.resource_group_name
  
    frontend_ip_configuration {
      name                 = "PublicIPAddress"
      public_ip_address_id = azurerm_public_ip.main.id
    }
  }
  
  resource "azurerm_lb_backend_address_pool" "main" {
    loadbalancer_id = azurerm_lb.main.id
    name            = "BackEndAddressPool"
  }
  
  resource "azurerm_network_interface" "main" {
    count               = var.vm_count
    name                = "${var.nic_name}-${count.index}"
    location            = var.location
    resource_group_name = var.resource_group_name
  
    ip_configuration {
      name                          = "testconfiguration1"
      subnet_id                     = azurerm_subnet.main.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.main.id
    }
  }
  
  resource "azurerm_lb_nat_rule" "main" {
    count                            = var.vm_count
    resource_group_name              = var.resource_group_name
    loadbalancer_id                  = azurerm_lb.main.id
    name                             = "LBRule${count.index}"
    protocol                         = "Tcp"
    frontend_port                    = 50000 + count.index
    backend_port                     = 22
    frontend_ip_configuration_name   = "PublicIPAddress"
    enable_floating_ip               = false
    idle_timeout_in_minutes          = 4
    backend_address_pool_id          = azurerm_lb_backend_address_pool.main.id
  }
  
  resource "azurerm_availability_set" "main" {
    name                = var.av_set_name
    location            = var.location
    resource_group_name = var.resource_group_name
    managed             = true
  }
  
  resource "azurerm_virtual_machine" "main" {
    count                 = var.vm_count
    name                  = "${var.vm_name_prefix}-${format("%02d", count.index)}"
    location              = var.location
    resource_group_name   = var.resource_group_name
    network_interface_ids = [element(azurerm_network_interface.main.*.id, count.index)]
    availability_set_id   = azurerm_availability_set.main.id
    vm_size               = var.vm_size
  
    storage_image_reference {
      id = var.vm_image_id
    }
  
    storage_os_disk {
      name              = "osdisk-${format("%02d", count.index)}"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Premium_LRS"
    }
  
    os_profile {
      computer_name  = "hostname-${format("%02d", count.index)}"
      admin_username = "adminuser"
      admin_password = "Password1234!"
    }
  
    os_profile_linux_config {
      disable_password_authentication = false
    }
  
    tags = {
      environment = "development"
    }
  }
  
  resource "azurerm_managed_disk" "main" {
    count                = var.vm_count
    name                 = "datadisk-${format("%02d", count.index)}"
    location             = var.location
    resource_group_name  = var.resource_group_name
    storage_account_type = "Premium_LRS"
    create_option        = "Empty"
    disk_size_gb         = "1024"
  }
  
  