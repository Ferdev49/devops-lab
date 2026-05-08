# Project 1: 3-Tier AWS Application Architecture

## Project Overview
Production-ready 3-tier AWS application with Terraform IaC.

## Architecture Tiers

### Tier 1: Presentation Tier (Load Balancer)
**Purpose:** Route traffic to application tier

**Components:**
- Route 53: DNS routing
- Application Load Balancer (ALB): HTTP/HTTPS load balancing
- CloudFront (optional): CDN for static content

**Security:**
- Sits in public subnets
- Security Group allows 80/443 inbound
- DDoS protection with AWS Shield

### Tier 2: Application Tier (Compute)
**Purpose:** Run application logic

**Components:**
- EC2 instances: Application servers
- Auto Scaling Group: Scale based on demand
- Launch Template: Define instance configuration
- IAM Roles: Permissions for EC2

**Security:**
- Sits in private subnets
- Security Group allows traffic only from ALB
- No direct internet access
- SSH only via bastion host (optional)

### Tier 3: Data Tier (Database)
**Purpose:** Store and manage data

**Components:**
- RDS: Managed relational database
- Multi-AZ deployment: High availability
- Backup: Automated backups
- Read Replicas (optional): Scaling reads

**Security:**
- Sits in private subnets
- Security Group allows traffic only from app tier
- Encrypted at rest (KMS)
- Encrypted in transit
- No internet access

## Network Design

### VPC Layout
- CIDR: 10.0.0.0/16
- 3 Availability Zones (for HA)

### Public Subnets (for ALB)
- Tier1-AZ1: 10.0.1.0/24
- Tier1-AZ2: 10.0.2.0/24
- Tier1-AZ3: 10.0.3.0/24

### Private Subnets (for App Tier)
- Tier2-AZ1: 10.0.11.0/24
- Tier2-AZ2: 10.0.12.0/24
- Tier2-AZ3: 10.0.13.0/24

### Database Subnets (for RDS)
- DB-AZ1: 10.0.21.0/24
- DB-AZ2: 10.0.22.0/24
- DB-AZ3: 10.0.23.0/24

## Terraform Module Structure

```text
terraform/
├── main.tf               # Root module entry point
├── variables.tf          # Input variables
├── outputs.tf            # Output values
├── terraform.tfvars      # Variable values
│
├── modules/
│   ├── networking/
│   │   ├── main.tf       # VPC, subnets, route tables
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── load_balancer/
│   │   ├── main.tf       # ALB, target group
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── app_tier/
│   │   ├── main.tf       # ASG, launch template
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── database/
│       ├── main.tf       # RDS instance
│       ├── variables.tf
│       └── outputs.tf
│
└── environments/
    ├── dev.tfvars
    ├── staging.tfvars
    └── prod.tfvars
```

## High Availability Design

- **Multi-AZ:** Each tier spans 3 AZs
- **Load Balancing:** ALB distributes traffic
- **Auto Scaling:** App tier scales automatically
- **RDS Multi-AZ:** Automatic failover
- **Health Checks:** Automatic instance replacement
- **Result:** 99.99% uptime target

## Security Best Practices

✅ VPC isolation (private subnets for app/db)
✅ Security Groups (least privilege)
✅ Encryption at rest (RDS KMS)
✅ Encryption in transit (TLS/SSL)
✅ IAM roles (not keys on EC2)
✅ Automated backups
✅ No direct DB access
✅ Bastion host for SSH (optional)

## Deployment Strategy

### Phase 1 (Today): Foundation
- VPC and networking
- Security Groups
- IAM roles

### Phase 2 (Tomorrow): Load Balancer
- ALB configuration
- Target groups
- Health checks

### Phase 3 (Wednesday): Application Tier
- Launch template
- Auto Scaling Group
- User data script

### Phase 4 (Thursday): Database
- RDS instance
- Multi-AZ setup
- Backups

### Phase 5 (Friday): Integration & Testing
- Connect all tiers
- Load testing
- Documentation

## Variables & Customization

Key variables:
- aws_region: Region deployment
- environment: dev/staging/prod
- app_instance_type: t3.medium (dev), t3.large (prod)
- db_instance_type: db.t3.micro (dev), db.t3.small (prod)
- min_size: Minimum ASG instances
- max_size: Maximum ASG instances
- desired_capacity: Desired instances

## Cost Optimization

- Use t3 instances (burstable, cheap)
- Reserved instances for production
- Spot instances for dev/test
- RDS Single-AZ for dev, Multi-AZ for prod
- Lifecycle policies for logs

Estimated cost:
- Dev: \-150/month
- Staging: \-300/month
- Production: \-1000/month

## Success Criteria

✅ VPC created with proper subnetting
✅ All tiers can communicate
✅ ALB routing traffic correctly
✅ RDS accessible from app tier
✅ High availability verified
✅ Security Groups properly configured
✅ All resources created via Terraform
✅ State managed remotely

