module "alb" {
    source  = "terraform-aws-modules/alb/aws"
    version = "8.6.0"

    name = "${local.name}-alb"

    load_balancer_type = "application"

    vpc_id             = module.vpc.vpc_id
    subnets            = toset([for subnet in module.vpc.public_subnets: subnet])
    security_groups    = [ module.loadbalancer_sg.security_group_id ]

    http_tcp_listeners = [
        {
        port               = 80
        protocol           = "HTTP"
        target_group_index = 0
        }
    ]

    target_groups = [
        {
            name_prefix                       = "app-tg"
            backend_protocol                  = "HTTP"
            backend_port                      = 80
            target_type                       = "instance"
            deregistration_delay              = 10
            load_balancing_cross_zone_enabled = false
            health_check = {
                enabled             = true
                interval            = 30
                path                = "/index.html"
                port                = "traffic-port"
                healthy_threshold   = 3
                unhealthy_threshold = 3
                timeout             = 6
                protocol            = "HTTP"
                matcher             = "200-399"
            }

            protocol_version = "HTTP1"

            targets = local.tg_vms

            tags = local.common_tags

        }
    ]

    tags = local.common_tags
}