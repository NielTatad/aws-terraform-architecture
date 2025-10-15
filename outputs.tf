# Main Outputs

# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}

output "nat_gateway_public_ip" {
  description = "Public IP of the NAT Gateway"
  value       = module.vpc.nat_gateway_public_ip
}

# EC2 Outputs
output "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = module.ec2.instance_ids
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = module.ec2.instance_public_ips
}

output "ec2_instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = module.ec2.instance_private_ips
}

output "ec2_instance_public_dns" {
  description = "Public DNS names of the EC2 instances"
  value       = module.ec2.instance_public_dns
}

output "ec2_ebs_volume_ids" {
  description = "IDs of the EBS volumes"
  value       = module.ec2.ebs_volume_ids
}

output "ec2_eip_public_ips" {
  description = "Public IP addresses of the Elastic IPs"
  value       = module.ec2.eip_public_ips
}

output "ec2_eip_allocation_ids" {
  description = "Allocation IDs of the Elastic IPs"
  value       = module.ec2.eip_allocation_ids
}

# RDS Outputs
output "rds_instance_id" {
  description = "ID of the RDS instance"
  value       = module.rds.db_instance_id
}

output "rds_instance_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.rds.db_instance_endpoint
}

output "rds_instance_address" {
  description = "Address of the RDS instance"
  value       = module.rds.db_instance_address
}

output "rds_instance_port" {
  description = "Port of the RDS instance"
  value       = module.rds.db_instance_port
}

output "rds_instance_name" {
  description = "Name of the RDS database"
  value       = module.rds.db_instance_name
}

# Security Group Outputs
output "public_security_group_id" {
  description = "ID of the public security group"
  value       = module.vpc.public_security_group_id
}

output "private_security_group_id" {
  description = "ID of the private security group"
  value       = module.vpc.private_security_group_id
}
