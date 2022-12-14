locals {
  dbsubnets             = ["db", "db2"]
  db_subnet_name        = "amat"
  db_allocated_storage  = 20
  engine                = "mysql"
  username              = "amatglobaluser"
  password              = "rootroot"
  port_mysql            = 3306
  anywhere_cidr         = "0.0.0.0/0"
  start_port            = 0
  end_port              = 65535
  protocol              = "tcp"
}
