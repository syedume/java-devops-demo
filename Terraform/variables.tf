variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name prefix used for tagging and naming resources."
  type        = string
  default     = "java-devops-demo"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "java-devops-demo-cluster"
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.27"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones for subnet placement."
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}