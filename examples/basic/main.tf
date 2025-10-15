# Basic Example Configuration
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
  region = "us-east-1"
}

# Use the main module
module "aws_infrastructure" {
  source = "../../"

  # General Configuration
  project_name = "basic-example"
  environment  = "dev"
  aws_region   = "us-east-1"

  # VPC Configuration
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "us-east-1a"

  # EC2 Configuration
  ec2_instance_count    = 1
  ec2_instance_type     = "t3.micro"
  ec2_create_storage    = true
  ec2_volume_size       = 20
  ec2_volume_encrypted  = true
  ec2_create_key_pair   = false  # Set to true if you have a public key
  ec2_public_key        = ""     # Add your SSH public key here
  ec2_create_eip        = true   # Set to true for static public IP

  # RDS Configuration
  rds_identifier            = "basic-db"
  rds_engine               = "mysql"
  rds_engine_version       = "8.0"
  rds_instance_class       = "db.t3.micro"
  rds_db_name             = "example_db"
  rds_username            = "admin"
  rds_password            = "SecurePassword123!"  # Change this!
  rds_backup_retention_period = 7
  rds_storage_encrypted   = true
  rds_deletion_protection = false
  rds_skip_final_snapshot = true
}
