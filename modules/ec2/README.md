# EC2 Module

This module creates EC2 instances with optional EBS storage and key pairs.

## Features

- EC2 instances with configurable instance type
- Optional EBS volume attachment
- Elastic IP (EIP) support for static public IP addresses
- Key pair management
- Launch template for consistent instance configuration
- Latest Amazon Linux 2 AMI selection
- Encrypted storage by default

## Usage

```hcl
module "ec2" {
  source = "./modules/ec2"
  
  project_name        = "my-project"
  environment        = "dev"
  instance_count     = 1
  instance_type      = "t3.micro"
  subnet_id          = module.vpc.public_subnet_id
  security_group_ids = [module.vpc.public_security_group_id]
  availability_zone  = "us-east-1a"
  
  create_storage     = true
  volume_size        = 20
  volume_encrypted   = true
  create_eip         = true
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_name | Name of the project | string | "aws-infrastructure" |
| environment | Environment name | string | "dev" |
| instance_count | Number of instances to create | number | 1 |
| instance_type | EC2 instance type | string | "t3.micro" |
| subnet_id | Subnet ID where the instance will be launched | string | - |
| security_group_ids | List of security group IDs | list(string) | - |
| availability_zone | Availability zone for EBS volume | string | - |
| create_storage | Whether to create additional EBS volume | bool | true |
| volume_size | Size of the EBS volume in GB | number | 20 |
| volume_encrypted | Whether to encrypt the EBS volume | bool | true |
| create_eip | Whether to create and attach Elastic IP | bool | true |

## Outputs

| Name | Description |
|------|-------------|
| instance_ids | IDs of the EC2 instances |
| instance_public_ips | Public IP addresses of the EC2 instances |
| instance_private_ips | Private IP addresses of the EC2 instances |
| ebs_volume_ids | IDs of the EBS volumes |
| eip_public_ips | Public IP addresses of the Elastic IPs |
| eip_allocation_ids | Allocation IDs of the Elastic IPs |
