# Variables VPC

# variable "vpc_identification"{}

variable "aws_availability_zone" {
  default = "us-east-1b"
}

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

variable "project_name" {
    default     = "tvp25222"
} 

variable "rds_allowed_cidr_blocks" {
  type = "list"
}