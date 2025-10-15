# RDS Module

This module creates Amazon RDS instances with configurable options for MySQL, PostgreSQL, and other database engines.

## Features

- RDS instance with configurable engine and version
- DB subnet group for multi-AZ deployment
- Optional parameter and option groups
- Optional read replica
- Backup and maintenance window configuration
- Performance Insights support
- Encryption at rest
- Security group integration

## Usage

```hcl
module "rds" {
  source = "./modules/rds"
  
  project_name     = "my-project"
  environment     = "dev"
  identifier      = "my-db"
  engine          = "mysql"
  engine_version  = "8.0"
  instance_class  = "db.t3.micro"
  
  db_name    = "mydb"
  username   = "admin"
  password   = var.db_password
  
  subnet_ids         = [module.vpc.private_subnet_id]
  security_group_ids = [module.vpc.private_security_group_id]
  
  backup_retention_period = 7
  storage_encrypted      = true
  deletion_protection    = false
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_name | Name of the project | string | "aws-infrastructure" |
| environment | Environment name | string | "dev" |
| identifier | The name of the RDS instance | string | - |
| engine | The database engine | string | "mysql" |
| engine_version | The engine version | string | "8.0" |
| instance_class | The instance type | string | "db.t3.micro" |
| db_name | The name of the database | string | "mydb" |
| username | Username for the master DB user | string | "admin" |
| password | Password for the master DB user | string | - |
| subnet_ids | A list of VPC subnet IDs | list(string) | - |
| security_group_ids | List of VPC security groups | list(string) | - |
| storage_encrypted | Specifies whether the DB instance is encrypted | bool | true |
| backup_retention_period | The days to retain backups | number | 7 |

## Outputs

| Name | Description |
|------|-------------|
| db_instance_id | The RDS instance ID |
| db_instance_endpoint | The RDS instance endpoint |
| db_instance_address | The hostname of the RDS instance |
| db_instance_port | The database port |
| db_instance_name | The database name |
| db_instance_username | The master username |
