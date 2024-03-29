output "subnet_staging_public_a" {
  value = tolist("${aws_subnet.public_subnet_az_a.*.id}")
}

output "subnet_staging_public_b" {
  value = tolist("${aws_subnet.public_subnet_az_b.*.id}")
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}