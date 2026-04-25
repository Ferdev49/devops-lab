# Terraform Remote Backend Configuration - Day 10
# Demonstrates best practices for team collaboration

# This would be used in production with actual S3 backend
# For this learning exercise, we'll document the configuration

terraform {
  # Backend configuration for production (example)
  # Uncomment and configure for real AWS usage
  
  # backend "s3" {
  #   bucket         = "terraform-state-prod"
  #   key            = "devops-lab/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-locks"
  # }
  
  # For local learning, we use the default local backend
  required_version = ">= 1.0"
  
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {
  # Local provider for learning
}
