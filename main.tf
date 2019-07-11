provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source                = "./modules/vpc"
  aws_availability_zone = var.aws_availability_zone
  project_name          = var.project_name
}

module "s3_buckets" {
  source       = "./modules/s3_buckets"
  project_name = var.project_name
}

module "infra" {
  source            = "./modules/resources"
  project_name      = var.project_name
  ec2_ami           = "ami-4fffc834"
  ec2_instance_type = "t1.micro"
  ec2_keyname       = "kaypair"
  ec2_key_path      = "./llaves/id_rsa2.pub"
  sg_publico_id     = module.vpc.sg_public_info
  sg_privado_id     = module.vpc.sg_private_info
  vpc_identificador = module.vpc.vpc_identification
  subnet_privada_id = module.vpc.subnet_privada_id
  subnet_publica_id = module.vpc.subnet_publica_id
}
