# Output Values - These are displayed after terraform apply

output "project_info" {
  description = "Project information"
  value       = var.project_name
}

output "environment_info" {
  description = "Environment type"
  value       = var.environment
}

output "day_info" {
  description = "Learning day"
  value       = "Day 8 of 56"
}

output "terraform_installed" {
  description = "Terraform is installed and working"
  value       = "✅ Terraform installed and configured"
}
