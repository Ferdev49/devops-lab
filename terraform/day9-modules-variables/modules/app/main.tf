# Application module for Day 9

resource "local_file" "app_config" {
  filename = "/app-info.txt"
  content  = <<-EOT
    Application Module
    ==================
    
    Module Name: app
    Purpose: Organize application-related configurations
    
    Module Inputs (Variables):
    - app_name: Name of the application
    - app_version: Version of the application
    - environment: Environment (dev, staging, prod)
    - instance_count: Number of instances to create
    
    Module Outputs:
    - app_id: Application identifier
    - instance_ids: List of instance identifiers
    
    Key Concepts:
    - Modules accept inputs via variables
    - Modules export outputs for use in other modules
    - Variables can have types and defaults
    - Validation ensures input quality
  EOT
}
