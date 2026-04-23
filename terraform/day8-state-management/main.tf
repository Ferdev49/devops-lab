# Terraform configuration for Day 8 - State Management

terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {
  # Local provider configuration
}

# Create a local file to demonstrate Terraform state
resource "local_file" "terraform_info" {
  filename = "./terraform-state-info.txt"
  content  = <<-EOT
    Terraform State Management - Day 8
    ==================================
    
    Project: DevOps Learning Journey
    Day: 8 (Wednesday, April 22, 2026)
    Technology: Terraform
    
    What is Terraform?
    - Infrastructure as Code (IaC) tool
    - Manages cloud resources declaratively
    - Uses state files to track resources
    - Supports multiple cloud providers (AWS, Azure, GCP)
    
    Key Concepts:
    1. State File (.tfstate): Tracks resource state
    2. Resources: Infrastructure objects to create
    3. Providers: Interfaces to cloud platforms
    4. Variables: Input values for configurations
    5. Outputs: Values exported from configurations
    
    Terraform Workflow:
    1. terraform init - Initialize working directory
    2. terraform plan - Show what will be created
    3. terraform apply - Create resources
    4. terraform destroy - Remove resources
    
    State Management:
    - Local state (default)
    - Remote state (S3, Terraform Cloud, etc.)
    - State locking for team collaboration
    - State encryption for security
    
    Progress: Day 8/56 of DevOps Learning Journey
    Status: Terraform Basics In Progress
  EOT
}

# Create a local file for state information
resource "local_file" "state_info" {
  filename = "./state-explanation.txt"
  content  = <<-EOT
    Understanding Terraform State
    =============================
    
    What is State?
    - A mapping of your configuration to real-world resources
    - Stored in .tfstate file (JSON format)
    - Contains sensitive information (be careful!)
    - Should not be committed to version control
    
    Why State Matters:
    - Tracks resource IDs and attributes
    - Enables resource updates and deletions
    - Detects drift (real resources != configuration)
    - Required for team collaboration
    
    State File Security:
    - Don't commit to Git
    - Encrypt sensitive data
    - Use remote state for teams
    - Implement access controls
    
    State Management Best Practices:
    1. Use remote state for production
    2. Enable state locking
    3. Implement encryption
    4. Regular backups
    5. Version control for Terraform code (not state!)
    6. Use separate workspaces for environments
    
    Commands for State:
    - terraform state list: List resources
    - terraform state show: Show resource details
    - terraform state pull: Download state
    - terraform state push: Upload state
    - terraform state rm: Remove resource from state
    
    This is Day 1 of learning Terraform!
  EOT
}

# Output file paths
output "terraform_info_file" {
  description = "Path to Terraform information file"
  value       = local_file.terraform_info.filename
}

output "state_info_file" {
  description = "Path to state explanation file"
  value       = local_file.state_info.filename
}

output "terraform_version" {
  description = "Terraform version requirement"
  value       = "Terraform >= 1.0"
}
