output "app_id" {
  description = "Application identifier"
  value       = "${var.app_name}-${var.app_version}"
}

output "instance_count" {
  description = "Number of instances created"
  value       = var.instance_count
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}
