# Database module for Day 9

resource "local_file" "database_config" {
  filename = "/database-info.txt"
  content  = <<-EOT
    Database Module
    ===============
    
    Module Name: database
    Purpose: Organize database-related configurations
    
    Module Inputs (Variables):
    - db_engine: Database engine (postgres, mysql, etc.)
    - db_size: Size of database instance
    - backup_retention: Days to retain backups
    
    Module Outputs:
    - db_endpoint: Database endpoint
    - db_port: Database port
    
    Module Best Practices:
    - Sensitive outputs should be marked
    - Document all module dependencies
    - Use defaults for optional values
    - Validate input values
  EOT
}
