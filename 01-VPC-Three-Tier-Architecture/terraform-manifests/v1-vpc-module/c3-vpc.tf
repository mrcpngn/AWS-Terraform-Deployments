module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-terraform"
  cidr = var.terraform_vpc_cidr

  azs             = var.aws_availability_zones
  public_subnets  = var.public_subnet
  private_subnets = var.private_subnet

  # Database subnet
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets    = var.database_subnet

  # NAT gateway for outbound
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {

    Terraform = "true"
    Environment = "dev"

  }

}