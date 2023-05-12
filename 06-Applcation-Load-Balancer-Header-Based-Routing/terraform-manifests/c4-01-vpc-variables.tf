# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = [ "us-east-1a", "us-east-1b" ]
}

# VPC Name variable
variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "myVPC"
}

# VPC CIDR variables
variable "vpc_cidr" {
  description = "VPC Cidr"
  type = string
  default = "10.0.0.0/16"
}

# Public subnet variable
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"  
  type = list(string)
  default = [ "10.0.64.0/24", "10.0.65.0/24" ]
}

# Private subnet variable
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"  
  type = list(string)
  default = [ "10.0.80.0/24", "10.0.81.0/24" ]
}

# Database subnet variable
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"    
  type = list(string)
  default = [ "10.0.96.0/24", "10.0.95.0/24" ]
}

# VPC Create Database Subnet Group
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"    
  type = bool
  default = true
}

# VPC Create Database Subnet Route Table
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"    
  type = bool
  default = true
}

# VPC Create Database Subnet Route Table
variable "vpc_enable_nat_gateway" {
  description = "VPC Enable NAT Gateway"    
  type = bool
  default = true
}

# VPC Create Database Subnet Route Table
variable "vpc_single_nat_gateway" {
  description = "VPC Single NAT Gateway"    
  type = bool
  default = true
}

# VPC Enable DNS Hostnames
variable "vpc_enable_dns_hostnames" {
  description = "VPC Enable DNS Hostnames"    
  type = bool
  default = true
}

# VPC Enable DNS Support
variable "vpc_enable_dns_support" {
  description = "VPC Enable DNS Support"    
  type = bool
  default = true
}
