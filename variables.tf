
# Variables Generales
variable "aws_region" {
  description = "Region for the VPC"
  default     = "us-east-1"
}

variable "aws_access_key" {
  default = "AKIA42OEQ7G254QJVZHS"
}

variable "aws_secret_key" {
  default = "3+DQrE6BfjQ93QLA1+Ir4Xl64Ww70F2IxpM9B+yc"
}

variable "aws_availability_zone" {
  default = "us-east-1b"
}

# # Variables VPC

# variable "vpc_cidr" {
#   description = "CIDR for the VPC"
#   default     = "10.0.0.0/16"
# }

# variable "public_subnet_cidr" {
#   description = "CIDR for the public subnet"
#   default     = "10.0.1.0/24"
# }

# variable "private_subnet_cidr" {
#   description = "CIDR for the private subnet"
#   default     = "10.0.2.0/24"
# }

# variable "vpc_sg_public_name" {
#   default = "sg_public"
# }

# variable "vpc_sg_private_name" {
#   default = "sg_private"
# }

# variable "vpc_id_global" {
#   default = ""
# }


#  Variables EC2

# variable "ami" {
#   description = "AMI for EC2"
#   default     = "ami-4fffc834"
# }

# variable "ec2_instance_type" {
#   default = "t1.micro"
# }

# variable "ec2_keyname" {
#   default   = "keypair"
# }


# variable "key_path" {
#   description = "SSH Public Key path"
#   default     = "../llaves/id_rsa2.pub"
# }

# variable "project_name" {
#   description = "Nombre General del proyecto"
#   default     = "tvp25222"
# }


# # Variables para la funcion Lambda
# variable "lambda_function_name" {
#   default = "minimal_lambda_function"
# }

# variable "lambda_handler" {
#   default = "lambda.handler"
# }

# variable "lambda_runtime" {
#   default = "python3.6"
# }

# variable "lambda_zip_filename" {
#   default = "lambda_func.zip"
# }

# variable "lambda_source_filename" {
#   default = "lambda_func.py"
# }

# variable "lambda_param" {
#   default = "Hello"
# }

# # Variables para Instancia RDS

# variable "rds_engine" {
#   default = "mysql"
# }

# variable "rds_engine_version" {
#   default = "5.6.35"
# }

# variable "rds_instance_type" {
#     default = "t2.micro"
# }

# variable "rds_database_name" {
#     default = "terraform_test_db"
# }
# variable "rds_database_password" {
#     default = ""
# }
# variable "rds_database_user" {
#     default = "terraform"
# }
# variable "rds_instance_identifier" {
#     default = "terraform-mysql"
# }

# variable "rds_allowed_cidr_blocks" {
#   type = "list"
# }

# variable "rds_character_set" {
#   default = "utf8"
# }
