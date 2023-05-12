module "ec2_private_app1" {

  depends_on = [ module.vpc ]

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  name                   = "${var.environment}-app1"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  # monitoring             = true
  vpc_security_group_ids = [ module.private_private_sg.security_group_id ]

  subnet_ids             = toset([for subnet in module.vpc.private_subnets: subnet])
  instance_count         = var.private_instance_count
  user_data              = file("${path.module}/app1-install.sh")

  tags                   = local.common_tags

}