output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs created for the VPC."
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnet IDs created for the VPC."
  value       = module.vpc.private_subnets
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}
