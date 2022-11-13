data "azurerm_subnet" "amatsubnet" {
    name = "web-1"
    virtual_network_name = "amatvnet" 
    resource_group_name = "${azurerm_resource_group.amatrg.name}" 
}
