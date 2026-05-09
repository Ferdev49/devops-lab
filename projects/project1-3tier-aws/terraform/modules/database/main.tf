# Database Module - RDS PostgreSQL Multi-AZ

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ============================================
# DB SUBNET GROUP
# ============================================

resource "aws_db_subnet_group" "main" {
  name       = "${var.app_name}-db-subnet-group"
  subnet_ids = var.db_subnets

  tags = {
    Name = "${var.app_name}-db-subnet-group"
  }
}

# ============================================
# RDS SECURITY GROUP
# ============================================

resource "aws_security_group" "db" {
  name        = "${var.app_name}-db-sg"
  description = "Security group for RDS database"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.app_tier_sg_id]
    description     = "PostgreSQL from app tier"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-db-sg"
  }
}

# ============================================
# RDS PARAMETER GROUP
# ============================================

resource "aws_db_parameter_group" "main" {
  name        = "${var.app_name}-db-params"
  family      = "postgres15"
  description = "Parameter group for PostgreSQL 15"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }

  tags = {
    Name = "${var.app_name}-db-params"
  }
}

# ============================================
# RDS INSTANCE (PostgreSQL)
# ============================================

resource "aws_db_instance" "main" {
  identifier     = "${var.app_name}-db"
  engine         = "postgres"
  engine_version = "15.3"
  
  instance_class       = var.instance_type
  allocated_storage    = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db.id]
  parameter_group_name   = aws_db_parameter_group.main.name

  multi_az               = var.multi_az
  publicly_accessible    = false
  storage_encrypted      = true
  iops                   = 3000
  
  backup_retention_period = 7
  backup_window          = "03:00-04:00"
  maintenance_window     = "sun:04:00-sun:05:00"
  
  skip_final_snapshot       = false
  final_snapshot_identifier = "${var.app_name}-db-final-snapshot-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  
  enabled_cloudwatch_logs_exports = ["postgresql"]
  
  deletion_protection = false

  tags = {
    Name = "${var.app_name}-db"
  }

  depends_on = [aws_db_subnet_group.main, aws_security_group.db]
}

# ============================================
# DB OUTPUT FOR APP TIER
# ============================================

output "endpoint" {
  description = "RDS endpoint address"
  value       = aws_db_instance.main.endpoint
  sensitive   = false
}

output "db_address" {
  description = "RDS database address"
  value       = aws_db_instance.main.address
}

output "db_port" {
  description = "RDS database port"
  value       = aws_db_instance.main.port
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.main.db_name
}

output "db_username" {
  description = "Database username"
  value       = aws_db_instance.main.username
  sensitive   = true
}

output "security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.db.id
}
