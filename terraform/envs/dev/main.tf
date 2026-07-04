module "networking" {
  source = "../../modules/networking"

  project_name = "three-tier-devsecops"
  aws_region   = "eu-north-1"
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