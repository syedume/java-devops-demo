output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.cluster.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint URL of the EKS cluster."
  value       = module.cluster.cluster_endpoint
}
