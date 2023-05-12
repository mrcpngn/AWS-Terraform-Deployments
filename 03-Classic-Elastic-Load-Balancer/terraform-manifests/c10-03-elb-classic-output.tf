output "elb_id" {
  description = "The name of the ELB"
  value       = module.elb_classic.elb_id
}

output "elb_name" {
  description = "The name of the ELB"
  value       = module.elb_classic.elb_name
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = module.elb_classic.elb_dns_name
}

output "elb_zone_id" {
  description = "The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record)"
  value       = module.elb_classic.elb_zone_id
}

output "elb_instances" {
  description = "The list of instances in the ELB (if may be outdated, because instances are attached using elb_attachment resource)"
  value       = module.elb_classic.elb_instances
}