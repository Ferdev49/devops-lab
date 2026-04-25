# Root module outputs
# These export values from the root and modules

output "network_id" {
  description = "Network identifier from networking module"
  value       = module.networking.network_id
}

output "vpc_cidr" {
  description = "VPC CIDR from networking module"
  value       = module.networking.vpc_cidr
}

output "app_id" {
  description = "Application ID from app module"
  value       = module.app.app_id
}

output "instance_count" {
  description = "Instance count from app module"
  value       = module.app.instance_count
}

output "db_endpoint" {
  description = "Database endpoint from database module"
  value       = module.database.db_endpoint
}

output "db_port" {
  description = "Database port from database module"
  value       = module.database.db_port
}

output "deployment_summary" {
  description = "Summary of deployed resources"
  value = {
    environment = var.environment
    app_name    = var.app_name
    app_version = var.app_version
    db_engine   = var.db_engine
  }
}
