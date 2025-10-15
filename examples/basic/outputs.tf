# Basic Example Outputs

output "vpc_id" {
  description = "VPC ID"
  value       = module.aws_infrastructure.vpc_id
}

output "ec2_public_ip" {
  description = "EC2 instance public IP"
  value       = module.aws_infrastructure.ec2_instance_public_ips[0]
}

output "ec2_eip" {
  description = "EC2 instance Elastic IP"
  value       = module.aws_infrastructure.ec2_eip_public_ips[0]
}

output "ec2_ssh_command" {
  description = "SSH command to connect to EC2 instance"
  value       = "ssh ec2-user@${module.aws_infrastructure.ec2_eip_public_ips[0]}"
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = module.aws_infrastructure.rds_instance_endpoint
}

output "rds_connection_command" {
  description = "MySQL connection command"
  value       = "mysql -h ${module.aws_infrastructure.rds_instance_address} -P ${module.aws_infrastructure.rds_instance_port} -u admin -p"
}
