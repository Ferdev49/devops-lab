# Day 10 Outputs

output "backend_type" {
  description = "Backend type being used"
  value       = var.backend_type
}

output "environment" {
  description = "Environment"
  value       = var.environment
}

output "learning_complete" {
  description = "Learning milestone"
  value       = "Terraform Week (Days 8-10) Complete!"
}

output "next_phase" {
  description = "Next learning phase"
  value       = "Week 3-4: Kubernetes & AWS"
}
