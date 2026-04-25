variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
  
  validation {
    condition     = contains(["postgres", "mysql", "mariadb"], var.db_engine)
    error_message = "Must be postgres, mysql, or mariadb"
  }
}

variable "db_size" {
  description = "Database instance size"
  type        = string
  default     = "small"
}

variable "backup_retention" {
  description = "Backup retention in days"
  type        = number
  default     = 7
  
  validation {
    condition     = var.backup_retention >= 1 && var.backup_retention <= 35
    error_message = "Backup retention must be 1-35 days"
  }
}
