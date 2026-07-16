module "vpc" {
  source = "./modules/vpc"

  cidr = var.vpc_cidr
  azs  = var.availability_zones
}

module "eks"{
    source = "terraform-aws-modules/eks/aws"
    cluster_name = var.cluster_name
    cluster_version = "1.27"
    subnets = module.vpc.private_subnets
    vpc_id = module.vpc.vpc_id
}