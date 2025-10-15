# Main Terraform Configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  project_name           = var.project_name
  environment           = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  project_name        = var.project_name
  environment        = var.environment
  instance_count     = var.ec2_instance_count
  instance_type      = var.ec2_instance_type
  subnet_id          = module.vpc.public_subnet_id
  security_group_ids = [module.vpc.public_security_group_id]
  availability_zone  = var.availability_zone

  create_storage    = var.ec2_create_storage
  volume_size       = var.ec2_volume_size
  volume_encrypted  = var.ec2_volume_encrypted
  create_key_pair   = var.ec2_create_key_pair
  public_key        = var.ec2_public_key
  user_data         = var.ec2_user_data
  create_eip        = var.ec2_create_eip

  depends_on = [module.vpc]
}

# RDS Module
module "rds" {
  source = "./modules/rds"

  project_name     = var.project_name
  environment     = var.environment
  identifier      = var.rds_identifier
  engine          = var.rds_engine
  engine_version  = var.rds_engine_version
  instance_class  = var.rds_instance_class

  db_name  = var.rds_db_name
  username = var.rds_username
  password = var.rds_password

  subnet_ids         = [module.vpc.private_subnet_id]
  security_group_ids = [module.vpc.private_security_group_id]

  backup_retention_period = var.rds_backup_retention_period
  storage_encrypted      = var.rds_storage_encrypted
  deletion_protection    = var.rds_deletion_protection
  skip_final_snapshot    = var.rds_skip_final_snapshot

  depends_on = [module.vpc]
}
