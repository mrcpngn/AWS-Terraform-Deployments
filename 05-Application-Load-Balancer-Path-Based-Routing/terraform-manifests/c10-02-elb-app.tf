module "alb" {
    source  = "terraform-aws-modules/alb/aws"
    version = "8.6.0"

    name                = "${local.name}-alb"
    load_balancer_type  = "application"
    vpc_id              = module.vpc.vpc_id
    subnets             = toset([for subnet in module.vpc.public_subnets: subnet])
    security_groups     = [ module.loadbalancer_sg.security_group_id ]

    # Listeners
    # HTTP Listeners - HTTP to HTTPS Redirect
    http_tcp_listeners = [
        {
            port        = 80
            protocol    = "HTTP"
            action_type = "redirect"
            redirect    = {
                port        = "443"
                protocol    = "HTTPS"
                status_code = "HTTP_301"
            }
        },

    ]

    # Target groups - targets
    target_groups = [
        # App1 Target Group - TG Index 0
        {
            name_prefix                       = "app1-"
            backend_protocol                  = "HTTP"
            backend_port                      = 80
            target_type                       = "instance"
            deregistration_delay              = 10
            load_balancing_cross_zone_enabled = false
            health_check            = {
                enabled             = true
                interval            = 30
                path                = "/app1/index.html"
                port                = "traffic-port"
                healthy_threshold   = 3
                unhealthy_threshold = 3
                timeout             = 6
                protocol            = "HTTP"
                matcher             = "200-399"
            }

            protocol_version        = "HTTP1"
            targets                 = local.app1_tg
            tags                    = local.common_tags

        },
        # App2 Target Group - TG Index 1
        {
            name_prefix                       = "app2-"
            backend_protocol                  = "HTTP"
            backend_port                      = 80
            target_type                       = "instance"
            deregistration_delay              = 10
            load_balancing_cross_zone_enabled = false
            health_check            = {
                enabled             = true
                interval            = 30
                path                = "/app2/index.html"
                port                = "traffic-port"
                healthy_threshold   = 3
                unhealthy_threshold = 3
                timeout             = 6
                protocol            = "HTTP"
                matcher             = "200-399"
            }

            protocol_version        = "HTTP1"
            targets                 = local.app2_tg
            tags                    = local.common_tags

        }
    ]

    # HTTPS Listeners
    https_listeners = [
        # HTTPS Lister Index - 0 for HTTPS 443 port
        {
            port                = 443
            protocol            = "HTTPS"
            certificate_arn     = module.acm.acm_certificate_arn
            action_type         = "fixed-response"
            fixed_response      = {
                content_type = "text/plain"
                message_body = "Fixed Static message - For Root Context"
                status_code  = "200"
            }

        },
    ]

    # HTTPS Listeners Rules
    https_listener_rules = [
        # Rule1: /app1* should go to App1 EC2 Instances
        {
            https_listener_index = 0
            actions = [
                {
                    type = "forward"
                    target_group_index = 0             
                }
            ]

            conditions = [{
                path_patterns = ["/app1*"]
            }]
        },
        # Rule2: /app2* should go to App2 EC2 Instances
        {
            https_listener_index = 0
            actions = [
                {
                    type = "forward"
                    target_group_index = 1             
                }
            ]

            conditions = [{
                path_patterns = ["/app2*"]
            }]
        },

    ]

    tags = local.common_tags
}