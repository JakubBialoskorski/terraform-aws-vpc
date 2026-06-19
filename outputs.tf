output "public_subnet_ids_az_a" {
  description = "IDs of the public subnets created in AZ-a"
  value       = aws_subnet.public_subnet_az_a[*].id
}

output "public_subnet_ids_az_b" {
  description = "IDs of the public subnets created in AZ-b"
  value       = aws_subnet.public_subnet_az_b[*].id
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.vpc.id
}