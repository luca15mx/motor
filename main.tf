provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source = "./modules/vpc"  
  aws_availability_zone = "us-east-1b"
  project_name = "tvp25222"
}
