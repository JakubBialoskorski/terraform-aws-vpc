output "public_subnet_ids_az_a" {
  value = aws_subnet.public_subnet_az_a[*].id
}

output "public_subnet_ids_az_b" {
  value = aws_subnet.public_subnet_az_b[*].id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}