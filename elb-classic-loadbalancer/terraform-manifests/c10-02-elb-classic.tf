module "elb_classic" {


  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.1"

  name = "${local.name}-elb-classic"

  subnets         = toset([for subnet in module.vpc.public_subnets: subnet])
  security_groups = [ module.elb_classic_sg.security_group_id ]
  internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 8080
      lb_protocol       = "http"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  // ELB attachments
  number_of_instances = var.private_instance_count
  instances           = toset([for instance_id in module.ec2_private.id: instance_id])

  tags = local.common_tags
}