## Fetch subnet ids for db subnets
data "aws_subnet_ids" "dbsubnets" {
    vpc_id          = var.vpc_id
    filter {
        name   = "tag:Name"
        values = local.dbsubnets 
    }
}

# subnet group for database
resource "aws_db_subnet_group" "amat-db-group" {
    name            = local.db_subnet_name
    subnet_ids      = data.aws_subnet_ids.dbsubnets.ids
    tags            = {
        Name        =  "amat-db-subnet-group"
    }
    
}

# Security group for database
resource "aws_security_group" "rds-sg" {
    name            = "allow_mysql"
    description     = "security group for database"
    vpc_id          = var.vpc_id

    ingress {
        from_port   = local.port_mysql
        to_port     = local.port_mysql
        cidr_blocks = [ local.anywhere_cidr ]
        protocol    = local.protocol
    }

    egress {
        from_port   = local.start_port
        to_port     = local.end_port
        cidr_blocks = [ local.anywhere_cidr ]
        protocol    = local.protocol
    }

    depends_on      = [
        aws_db_subnet_group.amat-db-group
    ]
}

# mysql rds instance
resource "aws_db_instance" "primary_db" {
    allocated_storage               = local.db_allocated_storage
    allow_major_version_upgrade     = false
    auto_minor_version_upgrade      = true
    db_subnet_group_name            = local.db_subnet_name
    engine                          = local.engine
    engine_version                  = var.mysql_version
    identifier                      = var.primary_db_identifier
    instance_class                  = var.rds_instance_class
    max_allocated_storage           = 0
    multi_az                        = var.is_rds_multi_az
    name                            = var.dbname
    password                        = local.password
    publicly_accessible             = false
    vpc_security_group_ids          = [ aws_security_group.rds-sg.id ]
    username                        = local.username

    depends_on                      = [
        aws_security_group.rds-sg,
        aws_db_subnet_group.amat-db-group
    ]
    
}