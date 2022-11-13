resource "azurerm_resource_group" "amatrg" {
    location    = var.region
    name        = local.resource_group_name
    tags        = {
        Env     = "Dev"
    }
}

