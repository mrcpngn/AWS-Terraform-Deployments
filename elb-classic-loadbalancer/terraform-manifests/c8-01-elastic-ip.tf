resource "aws_eip" "bastion_eip" {

  depends_on = [ module.vpc, module.ec2_public ]
  instance      = module.ec2_public.id[0]
  vpc           = true
  tags = local.common_tags
  
}