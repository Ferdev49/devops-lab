# Terraform Modules & Variables - Day 9

## What are Modules?

Modules are containers for a set of Terraform resources that can be used together. They promote code reuse and organization.

### Benefits of Modules
- **Reusability**: Write once, use everywhere
- **Organization**: Group related resources
- **Maintainability**: Easier to update and maintain
- **Scalability**: Build complex infrastructure from simple blocks
- **Team Collaboration**: Share standard configurations

## Module Structure

\\\
my-module/
├── main.tf          # Resource definitions
├── variables.tf     # Input variables
├── outputs.tf       # Output values
└── README.md        # Module documentation
\\\

## Variables in Terraform

### Types of Variables
1. **String**: Text values
2. **Number**: Numeric values
3. **Bool**: True/False
4. **List**: Ordered collection
5. **Map**: Key-value pairs
6. **Object**: Complex structure
7. **Any**: Any type (default)

### Variable Definition

\\\hcl
variable "app_name" {
  description = "Name of application"
  type        = string
  default     = "myapp"
  
  validation {
    condition     = length(var.app_name) > 0
    error_message = "App name cannot be empty"
  }
}
\\\

### Providing Variable Values

1. **terraform.tfvars**
\\\hcl
app_name = "production-app"
environment = "prod"
\\\

2. **Command line**
\\\ash
terraform apply -var="app_name=myapp" -var="environment=prod"
\\\

3. **Environment variables**
\\\ash
export TF_VAR_app_name="myapp"
terraform apply
\\\

## Module Outputs

Outputs from modules can be used as inputs to other modules or displayed to the user.

\\\hcl
output "app_id" {
  description = "Application identifier"
  value       = "\-\"
}
\\\

## Module Composition

Root module calls other modules:

\\\hcl
module "networking" {
  source = "./modules/networking"
  
  environment = var.environment
  region      = var.region
}

module "app" {
  source = "./modules/app"
  
  app_name = var.app_name
  network_id = module.networking.network_id
}
\\\

## Best Practices

### ✅ DO:
- Keep modules focused and single-purpose
- Document all inputs and outputs
- Provide sensible defaults
- Use variable validation
- Version your modules
- Use meaningful names
- Include usage examples in README

### ❌ DON'T:
- Mix unrelated resources in modules
- Forget to document variables
- Hardcode values that should be variables
- Create overly complex modules
- Assume module users understand your logic

## Day 9 Project Structure

### networking module
- Input: environment, region, vpc_cidr
- Output: network_id, vpc_cidr

### app module
- Input: app_name, app_version, environment, instance_count
- Output: app_id, instance_count, environment

### database module
- Input: db_engine, db_size, backup_retention
- Output: db_endpoint, db_port, db_engine

### Root module
- Calls all three modules
- Exports consolidated outputs

## Module Reusability Example

Same networking module can be used for multiple environments:

\\\hcl
# Development
module "networking_dev" {
  source = "./modules/networking"
  environment = "dev"
  vpc_cidr = "10.0.0.0/16"
}

# Production
module "networking_prod" {
  source = "./modules/networking"
  environment = "prod"
  vpc_cidr = "10.1.0.0/16"
}
\\\

## Lessons Learned (Day 9)
1. Modules enable infrastructure code reuse
2. Variables make modules flexible and parameterized
3. Outputs allow modules to communicate
4. Validation ensures input quality
5. Proper organization scales as infrastructure grows
6. Documentation is critical for module usability
