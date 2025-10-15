# EC2 Module Outputs

output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.main[*].id
}

output "instance_arns" {
  description = "ARNs of the EC2 instances"
  value       = aws_instance.main[*].arn
}

output "instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.main[*].public_ip
}

output "instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.main[*].private_ip
}

output "instance_public_dns" {
  description = "Public DNS names of the EC2 instances"
  value       = aws_instance.main[*].public_dns
}

output "instance_private_dns" {
  description = "Private DNS names of the EC2 instances"
  value       = aws_instance.main[*].private_dns
}

output "key_pair_name" {
  description = "Name of the key pair"
  value       = var.create_key_pair ? aws_key_pair.main[0].key_name : var.key_name
}

output "ebs_volume_ids" {
  description = "IDs of the EBS volumes"
  value       = var.create_storage ? aws_ebs_volume.main[*].id : []
}

output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.main.id
}

output "launch_template_arn" {
  description = "ARN of the launch template"
  value       = aws_launch_template.main.arn
}

output "eip_public_ips" {
  description = "Public IP addresses of the Elastic IPs"
  value       = var.create_eip ? aws_eip.main[*].public_ip : []
}

output "eip_allocation_ids" {
  description = "Allocation IDs of the Elastic IPs"
  value       = var.create_eip ? aws_eip.main[*].id : []
}
