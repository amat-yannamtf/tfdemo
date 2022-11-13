resource "azurerm_sql_server" "amatsqldbserver" {
    count                           = var.create_db == "yes"? 1 : 0 
    name                            = "amat-sql-tfdemo"
    resource_group_name             = local.resource_group_name
    location                        = var.region
    version                         = "12.0" 
    administrator_login             = "amatglobaluser"
    administrator_login_password    = "Amatuser@123"

    depends_on = [
      azurerm_resource_group.amatrg
    ]
}

resource "azurerm_sql_database" "amatsqldb" {
    count                           = var.create_db == "yes"? 1 : 0 
    name                            = "amat-tf-db"
    resource_group_name             = local.resource_group_name
    location                        = var.region
    server_name                     = azurerm_sql_server.amatsqldbserver[count.index].name
    edition                         = "Basic" 

    depends_on = [
      azurerm_sql_server.amatsqldbserver
    ]
  
}


# Adding vnet connection
resource "azurerm_sql_virtual_network_rule" "allow-amatvent" {
    count                           = var.create_db == "yes"? 1 : 0 
    name                            = "amatvnet"
    resource_group_name             = local.resource_group_name
    server_name                     = azurerm_sql_server.amatsqldbserver[count.index].name
    # needs to be fixed
    subnet_id                       = azurerm_subnet.subnets[2].id

    depends_on = [
      azurerm_sql_database.amatsqldb,
      azurerm_subnet.subnets
    ] 
}

# Allow all the ip address from vnet range to access database
resource "azurerm_sql_firewall_rule" "allow_all_vnet" {
    count                           = var.create_db == "yes"? 1 : 0 
    name                            = "allowvnet"
    resource_group_name             = local.resource_group_name
    server_name                     = azurerm_sql_server.amatsqldbserver[count.index].name
    start_ip_address                = cidrhost(var.vnet_range, 0)
    end_ip_address                  = cidrhost(var.vnet_range, 65535)


    depends_on = [
      azurerm_sql_database.amatsqldb,
      azurerm_subnet.subnets
    ]
  
}