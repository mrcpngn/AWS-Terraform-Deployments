module "elb_classic_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  # Required agruments for bastion security group
  name = "loadbalancer-sg"
  description = "Security group with HTTP port open for the VPC block (IPv4)"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules and CIDR blocks
  ingress_rules       = [ "http-80-tcp" ]  
  ingress_cidr_blocks = [ "0.0.0.0/0" ]

  # Egress Rules and CIDR blocks
  egress_rules = ["all-all"]
  
  tags = local.common_tags

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "allow-http-8080-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

}