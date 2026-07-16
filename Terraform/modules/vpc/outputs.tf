output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.this.id
}

output "private_subnets" {
  description = "IDs of the private subnets."
  value       = values(aws_subnet.private)[*].id
}
