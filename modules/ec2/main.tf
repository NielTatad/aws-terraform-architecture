# EC2 Module - Main Configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Data source to get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create key pair for EC2 instance
resource "aws_key_pair" "main" {
  count      = var.create_key_pair ? 1 : 0
  key_name   = "${var.project_name}-key-pair"
  public_key = var.public_key

  tags = {
    Name        = "${var.project_name}-key-pair"
    Environment = var.environment
  }
}

# Create EBS volume for storage
resource "aws_ebs_volume" "main" {
  count             = var.create_storage ? 1 : 0
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = var.volume_type
  encrypted         = var.volume_encrypted

  tags = {
    Name        = "${var.project_name}-storage"
    Environment = var.environment
  }
}

# Launch Template for EC2 instance
resource "aws_launch_template" "main" {
  name_prefix   = "${var.project_name}-"
  image_id      = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.create_key_pair ? aws_key_pair.main[0].key_name : var.key_name

  vpc_security_group_ids = var.security_group_ids

  user_data = base64encode(var.user_data)

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.root_volume_size
      volume_type = var.root_volume_type
      encrypted   = var.root_volume_encrypted
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-ec2"
      Environment = var.environment
    }
  }

  tags = {
    Name        = "${var.project_name}-launch-template"
    Environment = var.environment
  }
}

# Create Elastic IP for EC2 instances
resource "aws_eip" "main" {
  count    = var.create_eip ? var.instance_count : 0
  domain   = "vpc"
  instance = aws_instance.main[count.index].id

  tags = {
    Name        = "${var.project_name}-eip-${count.index + 1}"
    Environment = var.environment
  }

  depends_on = [aws_instance.main]
}

# Create EC2 instance
resource "aws_instance" "main" {
  count                  = var.instance_count
  ami                    = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name              = var.create_key_pair ? aws_key_pair.main[0].key_name : var.key_name
  subnet_id             = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  user_data             = var.user_data

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.root_volume_encrypted
  }

  tags = {
    Name        = "${var.project_name}-ec2-${count.index + 1}"
    Environment = var.environment
  }
}

# Attach EBS volume to EC2 instance
resource "aws_volume_attachment" "main" {
  count       = var.create_storage ? var.instance_count : 0
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.main[0].id
  instance_id = aws_instance.main[count.index].id
}
