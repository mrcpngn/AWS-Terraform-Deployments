module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  # Required agruments for bastion security group
  name = "public-bastion-sg"
  description = "Security group with SSH port open for all egress connection (IPv4)"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules and CIDR blocks
  ingress_rules       = [ "ssh-tcp" ]  
  ingress_cidr_blocks = [ "0.0.0.0/0" ]

  # Egress Rules and CIDR blocks
  egress_rules = ["all-all"]

  tags = local.common_tags

}