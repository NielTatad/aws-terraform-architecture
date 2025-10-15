# Main Variables

# General Configuration
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "aws-infrastructure"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability zone for resources"
  type        = string
  default     = "us-east-1a"
}

# EC2 Configuration
variable "ec2_instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_create_storage" {
  description = "Whether to create additional EBS volume for EC2"
  type        = bool
  default     = true
}

variable "ec2_volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 20
}

variable "ec2_volume_encrypted" {
  description = "Whether to encrypt the EBS volume"
  type        = bool
  default     = true
}

variable "ec2_create_key_pair" {
  description = "Whether to create a new key pair for EC2"
  type        = bool
  default     = false
}

variable "ec2_public_key" {
  description = "Public key for the EC2 key pair (required if ec2_create_key_pair is true)"
  type        = string
  default     = ""
}

variable "ec2_user_data" {
  description = "User data script for EC2 instances"
  type        = string
  default     = ""
}

variable "ec2_create_eip" {
  description = "Whether to create and attach Elastic IP to EC2 instances"
  type        = bool
  default     = true
}

# RDS Configuration
variable "rds_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "main-db"
}

variable "rds_engine" {
  description = "RDS engine"
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "RDS engine version"
  type        = string
  default     = "8.0"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_db_name" {
  description = "RDS database name"
  type        = string
  default     = "mydb"
}

variable "rds_username" {
  description = "RDS master username"
  type        = string
  default     = "admin"
}

variable "rds_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "rds_backup_retention_period" {
  description = "RDS backup retention period in days"
  type        = number
  default     = 7
}

variable "rds_storage_encrypted" {
  description = "Whether to encrypt RDS storage"
  type        = bool
  default     = true
}

variable "rds_deletion_protection" {
  description = "Whether to enable RDS deletion protection"
  type        = bool
  default     = false
}

variable "rds_skip_final_snapshot" {
  description = "Whether to skip final snapshot when deleting RDS"
  type        = bool
  default     = true
}
