# Variables VPC

variable "aws_availability_zone" {}

variable "project_name" {}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default     = "10.0.2.0/24"
}

variable "vpc_sg_public_name" {
  default = "sg_public"
}

variable "vpc_sg_private_name" {
  default = "sg_private"
}
