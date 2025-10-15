# AWS Infrastructure as Code

This repository contains Terraform modules for deploying a standard AWS infrastructure with VPC, EC2 instances, and RDS database following security best practices.

## Architecture Overview

The infrastructure follows AWS best practices with a secure, multi-tiered architecture:

![AWS Architecture Diagram](https://via.placeholder.com/800x600/0066cc/ffffff?text=AWS+Architecture+Diagram)

### Architecture Components

- **VPC** with public and private subnets for network isolation
- **Internet Gateway** for public internet access to public subnet
- **NAT Gateway** for secure outbound internet access from private subnet
- **EC2 instances** in the public subnet with Elastic IP addresses
- **RDS database** in the private subnet (no direct internet access)
- **Security groups** with minimal required access rules
- **EBS volumes** for encrypted data storage

### Network Flow

1. **Users** access the application through the **Internet Gateway**
2. **Public Subnet** hosts the web/application server (EC2) and NAT Gateway
3. **Private Subnet** contains the database (RDS) for security
4. **EC2** communicates with **RDS** for database operations
5. **RDS** uses **NAT Gateway** for outbound updates/patches

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- AWS account with necessary permissions

## Quick Start

1. **Clone and navigate to the repository:**
   ```bash
   cd IAC
   ```

2. **Set your AWS credentials:**
   ```bash
   export AWS_ACCESS_KEY_ID="your-access-key"
   export AWS_SECRET_ACCESS_KEY="your-secret-key"
   ```

3. **Create a `terraform.tfvars` file:**
   ```hcl
   project_name = "my-aws-project"
   environment  = "dev"
   aws_region   = "us-east-1"
   
   rds_password = "your-secure-password"
   
   # Optional: EC2 key pair
   ec2_create_key_pair = true
   ec2_public_key      = "ssh-rsa AAAAB3NzaC1yc2E... your-public-key"
   ```

4. **Initialize and deploy:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Module Structure

```
├── main.tf                 # Main configuration
├── variables.tf            # Input variables
├── outputs.tf              # Output values
├── README.md               # This file
├── modules/                # Reusable modules
│   ├── vpc/               # VPC and networking
│   ├── ec2/               # EC2 instances
│   └── rds/               # RDS database
└── examples/              # Example configurations
    └── basic/             # Basic example
```

## Configuration

### VPC Configuration
- **VPC CIDR:** 10.0.0.0/16 (default)
- **Public Subnet:** 10.0.1.0/24 (default)
- **Private Subnet:** 10.0.2.0/24 (default)
- **Availability Zone:** us-east-1a (default)

### EC2 Configuration
- **Instance Type:** t3.micro (default)
- **Storage:** 20GB encrypted EBS volume (default)
- **Security:** SSH, HTTP, HTTPS access from internet

### RDS Configuration
- **Engine:** MySQL 8.0 (default)
- **Instance Class:** db.t3.micro (default)
- **Storage:** Encrypted by default
- **Backup:** 7 days retention (default)

## Security Features

- Database isolated in private subnet
- Security groups with minimal required access
- Encrypted storage for all resources
- NAT Gateway for secure outbound access
- No direct internet access to database

## Usage Examples

See the `examples/basic/` directory for a complete example of how to use these modules.

## Outputs

After deployment, you can access:
- **EC2 instances** with static Elastic IP addresses for reliable SSH/web access
- **RDS endpoint** for secure database connections from EC2 instances
- **VPC and subnet IDs** for deploying additional resources
- **Security group IDs** for configuring additional access rules

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
