# VPC Module

This module creates a VPC with public and private subnets, including all necessary networking components.

## Features

- VPC with DNS support
- Internet Gateway for public access
- Public subnet with internet access
- Private subnet with NAT Gateway for outbound access
- Security groups for public and private resources
- Proper routing tables and associations

## Usage

```hcl
module "vpc" {
  source = "./modules/vpc"
  
  project_name           = "my-project"
  environment           = "dev"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  availability_zone    = "us-east-1a"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_name | Name of the project | string | "aws-infrastructure" |
| environment | Environment name | string | "dev" |
| vpc_cidr | CIDR block for VPC | string | "10.0.0.0/16" |
| public_subnet_cidr | CIDR block for public subnet | string | "10.0.1.0/24" |
| private_subnet_cidr | CIDR block for private subnet | string | "10.0.2.0/24" |
| availability_zone | Availability zone for subnets | string | "us-east-1a" |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | ID of the VPC |
| public_subnet_id | ID of the public subnet |
| private_subnet_id | ID of the private subnet |
| public_security_group_id | ID of the public security group |
| private_security_group_id | ID of the private security group |
