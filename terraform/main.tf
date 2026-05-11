provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
}

module "server" {
  source           = "./modules/server"
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_ids[0]
  key_name         = var.key_name
}

module "eks" {
  source             = "./modules/eks"
  private_subnet_ids = module.network.private_subnet_ids
  vpc_id             = module.network.vpc_id
}

module "ecr" {
  source = "./modules/ecr"
}
