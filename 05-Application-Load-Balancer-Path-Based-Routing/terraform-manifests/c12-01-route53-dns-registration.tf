resource "aws_route53_record" "apps_dns" {
    zone_id = data.aws_route53_zone.primary_domain.zone_id
    name    = format("apps.%s","${data.aws_route53_zone.primary_domain.name}")
    type    = "A"
    alias {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
    }
}