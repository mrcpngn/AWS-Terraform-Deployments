module "acm" {
    source  = "terraform-aws-modules/acm/aws"
    version = "4.3.2"

    domain_name  = trimsuffix(data.aws_route53_zone.primary_domain.name, ".")
    zone_id      = data.aws_route53_zone.primary_domain.zone_id
    subject_alternative_names = [ format("*.%s","${data.aws_route53_zone.primary_domain.name}") ]
    /*
    subject_alternative_names = [
        "*.my-domain.com"
    ]
    */
    tags = local.common_tags
}

# Outputs

output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}