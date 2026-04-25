# Networking module for Day 9
# Demonstrates module organization and outputs

resource "local_file" "network_config" {
  filename = "/network-info.txt"
  content  = <<-EOT
    Networking Module
    ================
    
    Module Name: networking
    Purpose: Organize network-related configurations
    
    Module Inputs (Variables):
    - environment: Network environment (dev, staging, prod)
    - region: Cloud region for network
    
    Module Outputs:
    - network_id: Identifier of the network
    - subnet_ids: List of subnet identifiers
    
    Best Practices:
    - Keep modules focused and single-purpose
    - Document all inputs and outputs
    - Use meaningful variable names
    - Provide sensible defaults
  EOT
}
