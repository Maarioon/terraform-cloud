terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


}


provider "aws" {
  region = var.region
}


# creating VPC
module "Network" {
  source                              = "./modules/Network"
  region                              = var.region
  vpc_cidr                            = var.vpc_cidr
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

module "ALB" {
  source             = "./modules/ALB"
  name               = "techeon-ext-alb"
  vpc_id             = module.Network.vpc_id
  public-sg          = module.Security.ALB-sg
  private-sg         = module.Security.IALB-sg
  public-sbn-1       = module.Network.public_subnets-1
  public-sbn-2       = module.Network.public_subnets-2
  private-sbn-1      = module.Network.private_subnets-1
  private-sbn-2      = module.Network.private_subnets-2
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
}

module "Security" {
  source = "./modules/Security"
  vpc_id = module.Network.vpc_id
}

module "Autoscaling" {
  source            = "./modules/Autoscaling"
  ami-web           = var.ami-web
  ami-bastion       = var.ami-bastion
  ami-nginx         = var.ami-nginx
  desired_capacity  = 2
  min_size          = 2
  max_size          = 2
  web-sg            = [module.Security.web-sg]
  bastion-sg        = [module.Security.bastion-sg]
  nginx-sg          = [module.Security.nginx-sg]
  wordpress-alb-tgt = module.ALB.wordpress-tgt
  nginx-alb-tgt     = module.ALB.nginx-tgt
  tooling-alb-tgt   = module.ALB.tooling-tgt
  instance_profile  = module.Network.instance_profile
  public_subnets    = [module.Network.public_subnets-1, module.Network.public_subnets-2]
  private_subnets   = [module.Network.private_subnets-1, module.Network.private_subnets-2]
  keypair           = var.keypair

}


# Module for Elastic Filesystem; this module will creat elastic file system isn the webservers availablity
# zone and allow traffic fro the webservers

module "EFS" {
  source       = "./modules/EFS"
  efs-subnet-1 = module.Network.private_subnets-1
  efs-subnet-2 = module.Network.private_subnets-2
  efs-sg       = [module.Security.datalayer-sg]
  account_no   = var.account_no
}

# RDS module; this module will create the RDS instance in the private subnet

module "RDS" {
  source          = "./modules/RDS"
  master-password = var.master-password
  master-username = var.master-username
  db-sg           = [module.Security.datalayer-sg]
  private_subnets = [module.Network.private_subnets-3, module.Network.private_subnets-4]
}

module "compute" {
  source          = "./modules/compute"
  ami-jenkins     = var.ami-bastion
  ami-sonar       = var.ami-sonar
  ami-jfrog       = var.ami-jfrog
  subnets-compute = module.Network.public_subnets-1
  sg-compute      = [module.Security.ALB-sg]
  keypair         = var.keypair
}