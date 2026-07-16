variable "project_name" {
  description = "Project name prefix for the VPC and subnets."
  type        = string
  default     = "java-devops-demo"
}

variable "cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "azs" {
  description = "Availability zones for subnet creation."
  type        = list(string)
}
