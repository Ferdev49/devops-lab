# Terraform Fundamentals - Day 8

## What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool that allows you to:
- Define infrastructure in configuration files
- Version control your infrastructure
- Automatically create and manage resources
- Work with multiple cloud providers
- Team collaboration on infrastructure

## Key Concepts

### 1. Infrastructure as Code (IaC)
Instead of clicking buttons in cloud console:
- Write configuration in files
- Version control your infrastructure
- Reproducible deployments
- Easy to understand and share

### 2. State File (.tfstate)
- Maps configuration to real resources
- Contains resource IDs and attributes
- Required for updates and deletions
- JSON format (human-readable but shouldn't edit manually)
- **IMPORTANT**: Contains sensitive data - don't commit to Git!

### 3. Terraform Workflow

\\\
1. Write Code (.tf files)
           ↓
2. terraform init (download providers)
           ↓
3. terraform plan (show what will happen)
           ↓
4. terraform apply (create resources)
           ↓
5. terraform destroy (remove resources)
\\\

### 4. Resources
Infrastructure objects you want to create:
- EC2 instances
- S3 buckets
- RDS databases
- VPCs, security groups, etc.

### 5. Providers
Interfaces to cloud platforms:
- AWS
- Azure
- Google Cloud
- Local (for local files)
- Many others

### 6. Variables
Input values for configurations:
- Can be provided via .tfvars files
- Command line arguments
- Environment variables
- Defaults in variables.tf

### 7. Outputs
Values exported after resources created:
- Public IPs
- DNS names
- Resource IDs
- Any other important info

## Day 8 Project

### What We Created
- main.tf: Basic Terraform configuration
- variables.tf: Variable definitions
- outputs.tf: Output values
- terraform.tfvars: Variable values
- .gitignore: Files to exclude from Git

### Resources Created
- local_file resources (to demonstrate state)
- Text files with Terraform information

### Outputs Shown
- terraform_info_file: Path to info file
- state_info_file: Path to state explanation
- terraform_version: Required version

## State Management Best Practices

### ✅ DO:
- Use remote state for production
- Enable state locking
- Encrypt state files
- Use .gitignore to exclude .tfstate
- Implement access controls
- Regular backups
- Use separate workspaces per environment

### ❌ DON'T:
- Commit .tfstate to Git
- Edit .tfstate manually
- Share state files via email
- Use same state for multiple environments
- Ignore state conflicts
- Leave sensitive data in state unencrypted

## State File Location

### Local State (Default)
- Stored in terraform.tfstate
- Good for learning/development
- Not suitable for teams

### Remote State
- Stored in cloud (S3, Terraform Cloud, etc.)
- Required for team collaboration
- Enables state locking
- Better security

## Terraform Commands

\\\ash
# Initialize working directory
terraform init

# Validate configuration syntax
terraform validate

# Format HCL code
terraform fmt

# Show plan (what will be created)
terraform plan

# Create resources
terraform apply

# Remove resources
terraform destroy

# Show resources in state
terraform state list

# Show resource details
terraform state show <resource>

# Pull current state
terraform state pull

# Push local state to remote
terraform state push
\\\

## Security Considerations

### State File Contains:
- Resource IDs
- Passwords
- API keys
- Private data

### Protection Measures:
1. Don't commit to Git
2. Encrypt in transit (remote state)
3. Restrict file permissions
4. Use remote state with encryption
5. Audit access logs

## HCL (HashiCorp Configuration Language)

Terraform uses HCL for configuration:

\\\hcl
# Provider
provider "aws" {
  region = "us-east-1"
}

# Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"
}

# Variable
variable "instance_count" {
  type    = number
  default = 2
}

# Output
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}
\\\

## Lessons Learned (Day 8)
1. Terraform manages infrastructure as code
2. State file is critical for resource tracking
3. Security: never commit state to Git
4. Providers connect to cloud platforms
5. HCL is simple and readable
6. Team collaboration requires remote state
7. Terraform workflow: init → plan → apply
