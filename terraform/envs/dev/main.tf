module "networking" {
  source = "../../modules/networking"

  project_name = "three-tier-devsecops"
  vpc_cidr     = var.vpc_cidr

  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr

  az_1 = var.az_1
  az_2 = var.az_2
}

module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
}

module "eks" {
  source = "../../modules/eks"

  project_name     = var.project_name
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  public_subnet_ids = [
    module.networking.public_subnet_1_id,
    module.networking.public_subnet_2_id
  ]
  cluster_sg_id      = module.security.cluster_sg_id
  node_instance_type = var.node_instance_type
  node_desired_size  = var.node_desired_size
  node_min_size      = var.node_min_size
  node_max_size      = var.node_max_size
  kubernetes_version = var.kubernetes_version
}

module "alb_integration" {
  source = "../../modules/alb-controller"

  project_name    = var.project_name
  oidc_issuer_url = module.eks.oidc_issuer_url
}