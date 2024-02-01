provider "aws" {
  region = "us-east-1" 
  
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./modules/route-table"
  sub_pub = module.vpc.public_subnet_ids[0]
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

module "ec2_instances" {
  source               = "./modules/ec2-instances"
  vpc_id               = module.vpc.vpc_id
  security_group_id    = module.security_group.security_group_id
  subnet_id            = module.vpc.public_subnet_ids[0] # Choose the appropriate subnet
  route_table_id       = module.route_table.route_table_id
  instance_count       = 2 # Number of EC2 instances
}

