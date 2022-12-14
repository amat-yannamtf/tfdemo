# primary vpc
resource "aws_vpc" "amat" {
    cidr_block  = var.primary_network_cidr
    tags        = {
        Name    = "amat primary"
    }
}

# subnets
resource "aws_subnet" "subnets" {
    vpc_id      = aws_vpc.amat.id
    count       = length(var.primary_subnets)
    cidr_block  = cidrsubnet(var.primary_network_cidr, 8, count.index)
    tags        = {
        Name    = var.primary_subnets[count.index]
    }
}

# internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id      = aws_vpc.amat.id
    tags        = {
        Name    = "amat primary"
    }

    depends_on  = [
        aws_subnet.subnets
    ]

}

# public route table and private route table
resource "aws_route_table" "route_tables" {
    vpc_id          = aws_vpc.amat.id
    count           = length(var.route_table_names)

    route {
        cidr_block  = "0.0.0.0/0"
        gateway_id  = aws_internet_gateway.igw.id
    }

    tags        = {
        Name    =  var.route_table_names[count.index]
    }
}


## associate public subnets
resource "aws_route_table_association" "public-associations" {
    subnet_id           = aws_subnet.subnets[local.public_subnets[count.index]].id
    route_table_id      = aws_route_table.route_tables[0].id
    count               = length(local.public_subnets)
}

## associate private subnets

resource "aws_route_table_association" "private-associations" {
    subnet_id           = aws_subnet.subnets[local.private_subnets[count.index]].id
    route_table_id      = aws_route_table.route_tables[1].id
    count               = length(local.private_subnets)
}

