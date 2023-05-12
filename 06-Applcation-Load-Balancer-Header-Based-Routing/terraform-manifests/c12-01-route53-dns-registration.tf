# Default DNS
resource "aws_route53_record" "route_default_dns" {
    zone_id = data.aws_route53_zone.primary_domain.zone_id
    name    = format("www.%s","${data.aws_route53_zone.primary_domain.name}")
    type    = "A"
    alias {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
    }
}

# Prefix1 DNS
resource "aws_route53_record" "route_prefix_dns1" {
    zone_id = data.aws_route53_zone.primary_domain.zone_id
    name    = format("${var.dns_prefix1}.%s","${data.aws_route53_zone.primary_domain.name}")
    type    = "A"
    alias {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
    }
}

# Prefix2 DNS
resource "aws_route53_record" "route_prefix_dns2" {
    zone_id = data.aws_route53_zone.primary_domain.zone_id
    name    = format("${var.dns_prefix2}.%s","${data.aws_route53_zone.primary_domain.name}")
    type    = "A"
    alias {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
    }
}