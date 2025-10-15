# RDS Module Outputs

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.main.id
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.main.arn
}

output "db_instance_endpoint" {
  description = "The RDS instance endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance"
  value       = aws_db_instance.main.hosted_zone_id
}

output "db_instance_address" {
  description = "The hostname of the RDS instance"
  value       = aws_db_instance.main.address
}

output "db_instance_port" {
  description = "The database port"
  value       = aws_db_instance.main.port
}

output "db_instance_name" {
  description = "The database name"
  value       = aws_db_instance.main.db_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.main.username
  sensitive   = true
}

output "db_instance_engine" {
  description = "The database engine"
  value       = aws_db_instance.main.engine
}

output "db_instance_engine_version" {
  description = "The running version of the database"
  value       = aws_db_instance.main.engine_version
}

output "db_instance_class" {
  description = "The RDS instance class"
  value       = aws_db_instance.main.instance_class
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = aws_db_subnet_group.main.id
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = aws_db_subnet_group.main.arn
}

output "parameter_group_id" {
  description = "The db parameter group id"
  value       = var.create_parameter_group ? aws_db_parameter_group.main[0].id : null
}

output "parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = var.create_parameter_group ? aws_db_parameter_group.main[0].arn : null
}

output "option_group_id" {
  description = "The db option group id"
  value       = var.create_option_group ? aws_db_option_group.main[0].id : null
}

output "option_group_arn" {
  description = "The ARN of the db option group"
  value       = var.create_option_group ? aws_db_option_group.main[0].arn : null
}

# Read replica outputs
output "read_replica_id" {
  description = "The RDS read replica instance ID"
  value       = var.create_read_replica ? aws_db_instance.read_replica[0].id : null
}

output "read_replica_arn" {
  description = "The ARN of the RDS read replica instance"
  value       = var.create_read_replica ? aws_db_instance.read_replica[0].arn : null
}

output "read_replica_endpoint" {
  description = "The RDS read replica instance endpoint"
  value       = var.create_read_replica ? aws_db_instance.read_replica[0].endpoint : null
}

output "read_replica_address" {
  description = "The hostname of the RDS read replica instance"
  value       = var.create_read_replica ? aws_db_instance.read_replica[0].address : null
}
