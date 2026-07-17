output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "IDs of the public subnets."
  value       = values(aws_subnet.public)[*].id
}

output "private_subnets" {
  description = "IDs of the private subnets."
  value       = values(aws_subnet.private)[*].id
}

output "subnet_ids" {
  description = "IDs of all created subnets."
  value       = concat(values(aws_subnet.public)[*].id, values(aws_subnet.private)[*].id)
}
