output primary_vpc_id {
  value       = aws_vpc.amat.id
  description = "This represents vpc id"
  depends_on  = []
}

output subnets {
  value       = aws_subnet.subnets[*].id
  description = "all subnet ids"
}

