# Day 10: Terraform Remote Backend & Team Collaboration

# Create documentation files to demonstrate concepts

resource "local_file" "backend_guide" {
  filename = "/BACKEND-GUIDE.txt"
  content  = <<-EOT
    Terraform Remote Backends - Day 10
    ===================================
    
    What is a Remote Backend?
    A remote backend stores Terraform state in a centralized location
    (like S3, Terraform Cloud, or Azure Storage) instead of locally.
    
    Benefits:
    1. Team Collaboration: Multiple team members can work on same infrastructure
    2. State Locking: Prevents concurrent modifications
    3. Consistency: Single source of truth for infrastructure state
    4. Security: Encryption at rest and in transit
    5. Backup: Automatic versioning and backup capabilities
    
    Common Remote Backends:
    - S3 (AWS)
    - Azure Storage (Azure)
    - Google Cloud Storage (GCP)
    - Terraform Cloud
    - Consul
    - etcd
    
    S3 Backend Example:
    terraform {
      backend "s3" {
        bucket         = "my-terraform-state"
        key            = "prod/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
        dynamodb_table = "terraform-locks"
      }
    }
    
    State Locking:
    - Prevents multiple operations on same state simultaneously
    - Uses DynamoDB table (AWS) to manage locks
    - Automatic locking/unlocking during terraform operations
    - Critical for team environments
    
    Team Collaboration Workflow:
    1. All developers use same remote backend
    2. Changes are pushed to central location
    3. State is locked during modifications
    4. Prevents conflicts and data loss
    5. Enables audit trail of changes
    
    Security Considerations:
    - Enable encryption at rest (S3 + KMS)
    - Enable encryption in transit (HTTPS)
    - Restrict IAM permissions to backend
    - Enable versioning for recovery
    - Use state locking with DynamoDB
    - Audit access logs
    - Separate state per environment
  EOT
}

resource "local_file" "migration_guide" {
  filename = "/MIGRATION-GUIDE.txt"
  content  = <<-EOT
    Migrating from Local to Remote State
    ===================================
    
    Step 1: Create S3 Bucket and DynamoDB Table
    - Create S3 bucket for state storage
    - Create DynamoDB table for locking
    - Enable versioning on S3 bucket
    - Configure encryption
    
    Step 2: Configure Backend in Code
    terraform {
      backend "s3" {
        bucket         = "terraform-state"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
        dynamodb_table = "terraform-locks"
      }
    }
    
    Step 3: Initialize with Backend
    terraform init
    # Terraform detects local state and asks to migrate
    
    Step 4: Confirm Migration
    # Answer 'yes' to migrate state to remote backend
    
    Step 5: Verify
    terraform state list
    # Should show resources from remote state
    
    Best Practices:
    - Migrate state during maintenance window
    - Backup local state before migration
    - Test with non-production state first
    - Document migration process
    - Enable state versioning
    - Set up monitoring for state changes
  EOT
}

resource "local_file" "workspace_guide" {
  filename = "/WORKSPACE-GUIDE.txt"
  content  = <<-EOT
    Terraform Workspaces for Environments
    ===================================
    
    What are Workspaces?
    Workspaces allow you to have multiple state files within
    a single Terraform configuration.
    
    Use Cases:
    - Dev, staging, and production environments
    - Multi-tenant applications
    - Multiple regions
    - A/B testing
    
    Workspace Commands:
    terraform workspace list      # List all workspaces
    terraform workspace new dev   # Create dev workspace
    terraform workspace select dev # Switch to dev workspace
    terraform workspace delete dev # Delete workspace
    
    Example Usage:
    
    # Create and use dev workspace
    terraform workspace new dev
    terraform workspace select dev
    terraform apply
    
    # Create and use prod workspace
    terraform workspace new prod
    terraform workspace select prod
    terraform apply
    
    # State files are separate per workspace
    # dev state: terraform.tfstate.d/dev/terraform.tfstate
    # prod state: terraform.tfstate.d/prod/terraform.tfstate
    
    With Remote Backend:
    - Workspaces stored in remote backend
    - Each workspace has own state
    - Same lock mechanism applies
    - Workspace separation is transparent
    
    Best Practice:
    - Use workspaces for environment separation
    - Different tfvars per workspace
    - Restrict access per environment
    - Monitor state changes per workspace
  EOT
}
