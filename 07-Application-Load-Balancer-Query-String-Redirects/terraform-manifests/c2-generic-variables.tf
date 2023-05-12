# Generic Global Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "environment" {
  description = "Environment variable used as a prefix"
  type = string
  default = "dev"
}

variable "business_division" {
  description = "Business division of the organization"
  type = string
  default = "HR"
}