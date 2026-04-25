# Root module variables
# These are the inputs to your configuration

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Cloud region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "my-app"
}

variable "app_version" {
  description = "Application version"
  type        = string
  default     = "1.0.0"
}

variable "app_instance_count" {
  description = "Number of app instances"
  type        = number
  default     = 2
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "db_size" {
  description = "Database size"
  type        = string
  default     = "small"
}

variable "backup_retention" {
  description = "Backup retention days"
  type        = number
  default     = 7
}
