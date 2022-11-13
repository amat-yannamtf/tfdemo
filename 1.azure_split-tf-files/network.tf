resource "azurerm_virtual_network" "amat_vnet" {
    name = "amat"
    resource_group_name = "${azurerm_resource_group.amatrg.name}"
    address_space = ["192.168.0.0/16"]
    location = "${azurerm_resource_group.amat.location}"
}

resource "azurerm_subnet" "web" {
    name = "web-1"
    resource_group_name = "${azurerm_resource_group.amatrg.name}"
    address_prefix = "192.168.0.0/24"
    virtual_network_name = "${azurerm_virtual_network.amat_vnet.name}"
  
}

resource "azurerm_subnet" "business" {
    name = "business-1"
    resource_group_name = "${azurerm_resource_group.amatrg.name}"
    address_prefix = "192.168.1.0/24"
    virtual_network_name = "${azurerm_virtual_network.amat_vnet.name}"
  
}

resource "azurerm_subnet" "db" {
    name = "db-1"
    resource_group_name = "${azurerm_resource_group.amatrg.name}"
    address_prefix = "192.168.2.0/24"
    virtual_network_name = "${azurerm_virtual_network.amat_vnet.name}"
  
}



