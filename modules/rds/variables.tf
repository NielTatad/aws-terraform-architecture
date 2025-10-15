# RDS Module Variables

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

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version"
  type        = string
  default     = "8.0"
}

variable "major_engine_version" {
  description = "The major engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (general purpose SSD), or 'io1' (provisioned IOPS SSD)"
  type        = string
  default     = "gp3"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default     = "mydb"
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 3306
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in"
  type        = string
  default     = "sun:04:00-sun:05:00"
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance"
  type        = number
  default     = 0
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs"
  type        = string
  default     = ""
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = ""
}

variable "option_group_name" {
  description = "Name of the DB option group to associate"
  type        = string
  default     = ""
}

variable "create_parameter_group" {
  description = "Whether to create a DB parameter group"
  type        = bool
  default     = false
}

variable "create_option_group" {
  description = "Whether to create a DB option group"
  type        = bool
  default     = false
}

variable "parameter_group_family" {
  description = "The DB parameter group family"
  type        = string
  default     = "mysql8.0"
}

variable "parameters" {
  description = "A list of DB parameters to apply"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  type        = bool
  default     = false
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data"
  type        = number
  default     = 7
}

# Read replica variables
variable "create_read_replica" {
  description = "Whether to create a read replica"
  type        = bool
  default     = false
}

variable "read_replica_instance_class" {
  description = "The instance type of the RDS read replica"
  type        = string
  default     = "db.t3.micro"
}

variable "read_replica_publicly_accessible" {
  description = "Bool to control if read replica is publicly accessible"
  type        = bool
  default     = false
}

variable "read_replica_security_group_ids" {
  description = "List of VPC security groups to associate with read replica"
  type        = list(string)
  default     = []
}

variable "read_replica_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the read replica"
  type        = number
  default     = 0
}

variable "read_replica_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs for read replica"
  type        = string
  default     = ""
}

variable "read_replica_performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled for read replica"
  type        = bool
  default     = false
}

variable "read_replica_performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data for read replica"
  type        = number
  default     = 7
}
