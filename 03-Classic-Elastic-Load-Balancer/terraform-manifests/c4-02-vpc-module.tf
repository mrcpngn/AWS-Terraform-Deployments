module "vpc" {

  source = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  # VPC General Settings
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr
  azs  = var.vpc_availability_zones

  # VPC Subnets
  public_subnets    = var.vpc_public_subnets
  private_subnets   = var.vpc_private_subnets
  database_subnets  = var.vpc_database_subnets

  # VPC Database subnet settings
  create_database_subnet_group        = var.vpc_create_database_subnet_group
  create_database_subnet_route_table  = var.vpc_create_database_subnet_route_table

  # VPC Nat gateway settings
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS settings
  enable_dns_hostnames  = var.vpc_enable_dns_hostnames
  enable_dns_support    = var.vpc_enable_dns_support

  # Main Resource Tags
  tags = local.common_tags

  # Additional Tags
  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

}