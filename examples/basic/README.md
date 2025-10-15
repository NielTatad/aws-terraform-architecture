# Basic Example

This example demonstrates how to use the AWS infrastructure modules to create a basic setup with:

- VPC with public and private subnets
- EC2 instance in the public subnet
- RDS MySQL database in the private subnet
- Proper security groups and networking

## Prerequisites

1. AWS CLI configured with appropriate credentials
2. Terraform >= 1.0 installed
3. SSH key pair (optional, for EC2 access)

## Usage

1. **Navigate to this directory:**
   ```bash
   cd examples/basic
   ```

2. **Customize the configuration:**
   Edit `main.tf` to modify:
   - Project name and environment
   - Instance types and sizes
   - Database configuration
   - Add your SSH public key if needed

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Review the plan:**
   ```bash
   terraform plan
   ```

5. **Apply the configuration:**
   ```bash
   terraform apply
   ```

6. **Access your resources:**
   - EC2: Use the public IP from outputs
   - RDS: Use the endpoint from outputs

## Important Notes

- **Change the RDS password** in `main.tf` before applying
- **Add your SSH public key** if you want to access EC2 instances
- **Review security groups** to ensure they meet your requirements
- **Consider using AWS Secrets Manager** for sensitive data in production

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Outputs

After successful deployment, you'll get:
- VPC ID
- EC2 public IP and SSH command
- RDS endpoint and connection command
