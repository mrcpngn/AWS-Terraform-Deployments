# Public Bastion Security Group output
# public_bastion_security_group_id
output "public_bastion_security_group_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_sg.security_group_id
}

# public_bastion_security_group_vpc_id
output "public_bastion_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_sg.security_group_vpc_id
}

# public_bastion_security_group_name
output "public_bastion_security_group_name" {
  description = "The name of the security group"
  value       = module.public_bastion_sg.security_group_name
}


# Private Bastion Security Group output
# private_bastion_security_group_id
output "private_bastion_security_group_id" {
  description = "The ID of the security group"
  value       = module.private_private_sg.security_group_id
}

# private_bastion_security_group_vpc_id
output "private_bastion_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_private_sg.security_group_vpc_id
}

# private_bastion_security_group_name
output "private_bastion_security_group_name" {
  description = "The name of the security group"
  value       = module.private_private_sg.security_group_name
}

