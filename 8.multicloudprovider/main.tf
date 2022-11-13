module "awsventdbdeploy" {
    source          = "./modules/awsventdbdeploy"
    vpc_cidr        = var.vpc_cidr
    instance_type   = var.instance_type
    subnet_cidrs    = var.subnet_cidrs
    subnet_azs      = var.subnet_azs
    subnet_names    = var.subnet_names
    
}

module "azureventdbdeploy" {
    source          = "./modules/azureventdbdeploy"
    vnet_range      = var.vnet_range
    region          = var.region
    subnet_names    = var.subnet_names
    build_id        = var.build_id
    create_db       = var.create_db
    
}

output "awswebip" {
    value = module.awsamat.web1_publicip
  
}

output "azurewebip" {
   value = module.azureamat.azure_publicip
}