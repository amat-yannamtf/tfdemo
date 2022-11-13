module "amat_azure" {
    source              = "git::https://github.com/amattf/azure_amat.git"
    network_cidr        = ["192.168.0.0/16"]
    subnet_names        = ["web", "app", "cache", "db"]
    appsubnet           = "app"
    websubnet           = "web"
    servername          = "amat1dbfrommodule"
    dbname              = "amat1ecommerce"
    vmsize              = "Standard_B1s"
    username            = "amatglobaluser"
    password            = "Amatuser@123"
    increment_execute   = "0"

}

output "webvm" {
    value = module.amat_azure.webserver_url

}