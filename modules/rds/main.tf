# RDS Module - Main Configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Create DB subnet group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.project_name}-db-subnet-group"
    Environment = var.environment
  }
}

# Create DB parameter group (optional)
resource "aws_db_parameter_group" "main" {
  count  = var.create_parameter_group ? 1 : 0
  family = var.parameter_group_family
  name   = "${var.project_name}-db-params"

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = {
    Name        = "${var.project_name}-db-params"
    Environment = var.environment
  }
}

# Create DB option group (optional)
resource "aws_db_option_group" "main" {
  count                    = var.create_option_group ? 1 : 0
  name                     = "${var.project_name}-db-options"
  option_group_description = "Option group for ${var.project_name}"
  engine_name              = var.engine
  major_engine_version     = var.major_engine_version

  tags = {
    Name        = "${var.project_name}-db-options"
    Environment = var.environment
  }
}

# Create RDS instance
resource "aws_db_instance" "main" {
  identifier = var.identifier

  # Engine configuration
  engine         = var.engine
  engine_version = var.engine_version

  # Instance configuration
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted

  # Database configuration
  db_name  = var.db_name
  username = var.username
  password = var.password
  port     = var.port

  # Network configuration
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.security_group_ids
  publicly_accessible    = var.publicly_accessible

  # Backup configuration
  backup_retention_period = var.backup_retention_period
  backup_window          = var.backup_window
  maintenance_window     = var.maintenance_window

  # Monitoring
  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = var.monitoring_role_arn

  # Parameter and option groups
  parameter_group_name = var.create_parameter_group ? aws_db_parameter_group.main[0].name : var.parameter_group_name
  option_group_name    = var.create_option_group ? aws_db_option_group.main[0].name : var.option_group_name

  # Deletion protection
  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.identifier}-final-snapshot-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"

  # Performance Insights
  performance_insights_enabled = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null

  tags = {
    Name        = "${var.project_name}-rds"
    Environment = var.environment
  }
}

# Create DB instance read replica (optional)
resource "aws_db_instance" "read_replica" {
  count = var.create_read_replica ? 1 : 0

  identifier = "${var.identifier}-replica"

  # Replica configuration
  replicate_source_db = aws_db_instance.main.identifier
  instance_class      = var.read_replica_instance_class
  publicly_accessible = var.read_replica_publicly_accessible

  # Network configuration
  vpc_security_group_ids = var.read_replica_security_group_ids

  # Monitoring
  monitoring_interval = var.read_replica_monitoring_interval
  monitoring_role_arn = var.read_replica_monitoring_role_arn

  # Performance Insights
  performance_insights_enabled = var.read_replica_performance_insights_enabled
  performance_insights_retention_period = var.read_replica_performance_insights_enabled ? var.read_replica_performance_insights_retention_period : null

  tags = {
    Name        = "${var.project_name}-rds-replica"
    Environment = var.environment
  }
}
