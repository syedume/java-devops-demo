module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  cidr         = var.vpc_cidr
  azs          = var.availability_zones
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
}