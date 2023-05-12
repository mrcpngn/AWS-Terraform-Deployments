# Get DNS information from AWS Route53
data "aws_route53_zone" "primary_domain" {
  name = var.domain_name
}

# Output Primary Domain zone ID
output "primary_domain_zoneid" {
  description = "Hosted Zone id of the desired Hosted Zone."
  value = data.aws_route53_zone.primary_domain.zone_id
}

# Output Primary Domain name
output "primary_domain_name" {
  description = "Hosted Zone name of the desired Hosted Zone."
  value = data.aws_route53_zone.primary_domain.name
}