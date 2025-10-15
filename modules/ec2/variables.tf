# EC2 Module Variables

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

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance (if empty, latest Amazon Linux 2 will be used)"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the instance"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the key pair to use for the instance"
  type        = string
  default     = ""
}

variable "create_key_pair" {
  description = "Whether to create a new key pair"
  type        = bool
  default     = false
}

variable "public_key" {
  description = "Public key for the key pair (required if create_key_pair is true)"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "Availability zone for the EBS volume"
  type        = string
}

variable "create_storage" {
  description = "Whether to create additional EBS volume"
  type        = bool
  default     = true
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 20
}

variable "volume_type" {
  description = "Type of the EBS volume"
  type        = string
  default     = "gp3"
}

variable "volume_encrypted" {
  description = "Whether to encrypt the EBS volume"
  type        = bool
  default     = true
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GB"
  type        = number
  default     = 8
}

variable "root_volume_type" {
  description = "Type of the root EBS volume"
  type        = string
  default     = "gp3"
}

variable "root_volume_encrypted" {
  description = "Whether to encrypt the root EBS volume"
  type        = bool
  default     = true
}

variable "create_eip" {
  description = "Whether to create and attach an Elastic IP to the EC2 instances"
  type        = bool
  default     = true
}
