variable "aws_region" {
  description = "This is the default aws region for this setup"
  type = string
  default = "us-east-1"
}


variable "aws_availability_zones" {
  
  type = list(string)
  default = [ "us-east-1a", "us-east-1b" ]

}

variable "terraform_vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
  
}

variable "public_subnet" {
  
  type = list(string)
  default = [ "10.0.64.0/24", "10.0.65.0/24" ]

}

variable "private_subnet" {
  
  type = list(string)
  default = [ "10.0.80.0/24", "10.0.81.0/24" ]

}

variable "database_subnet" {
  
  type = list(string)
  default = [ "10.0.96.0/24", "10.0.95.0/24" ]

}