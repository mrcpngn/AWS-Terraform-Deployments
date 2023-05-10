module "private_private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  # Required agruments for bastion security group
  name = "private-bastion-sg"
  description = "Security group with HTTP/SSH port open for the VPC block (IPv4)"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules and CIDR blocks
  ingress_rules       = [ "ssh-tcp", "http-80-tcp" ]  
  ingress_cidr_blocks = [ module.vpc.vpc_cidr_block ]

  # Egress Rules and CIDR blocks
  egress_rules = ["all-all"]
  
  tags = local.common_tags

}