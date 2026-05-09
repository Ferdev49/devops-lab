# Project 1: 3-Tier AWS Application Architecture

I am building a production-ready 3-tier AWS application using Terraform. A 3-tier architecture separates presentation, application, and data tiers. The presentation tier has an Application Load Balancer that routes traffic to the application tier. The application tier runs EC2 instances in an Auto Scaling Group to handle varying load. The database tier runs RDS with Multi-AZ deployment for high availability. Each tier sits in private subnets within a VPC for security. The load balancer sits in public subnets to receive internet traffic. Terraform code defines all infrastructure as code, making it reproducible and versionable. I created the architecture design, Terraform structure, and module skeleton. The implementation will happen over Days 22 through 25, with networking on Day 22, load balancer on Day 23, application tier on Day 24, and database integration on Day 25. This project demonstrates production-grade infrastructure design with high availability and security."

## Overview
Production-ready 3-tier AWS application using Terraform Infrastructure as Code.

**Status:** Day 21 - Foundation Phase
**Expected Completion:** Day 25
**Architecture:** ALB → EC2 ASG → RDS Multi-AZ

## Project Structure
```text
project1-3tier-aws/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   └── modules/
│       ├── networking/
│       ├── load_balancer/
│       ├── app_tier/
│       └── database/
├── docker/
│   ├── Dockerfile
│   └── app/
├── docs/
│   ├── ARCHITECTURE.md
│   ├── DEPLOYMENT.md
│   └── TROUBLESHOOTING.md
└── README.md
```

## 5-Day Implementation Plan

### Day 21 (Today): Foundation
- [x] Architecture design
- [x] Terraform structure
- [x] Module skeleton
- [ ] TODO: Start networking module implementation

### Day 22: Networking
- [ ] VPC with 3 AZs
- [ ] Public/Private/DB subnets
- [ ] Route tables
- [ ] NAT Gateway

### Day 23: Load Balancer
- [ ] ALB creation
- [ ] Target groups
- [ ] Health checks
- [ ] Security Groups

### Day 24: Application Tier
- [ ] Launch template
- [ ] Auto Scaling Group
- [ ] IAM roles
- [ ] User data script

### Day 25: Database & Integration
- [ ] RDS Multi-AZ
- [ ] Security groups
- [ ] Backups
- [ ] Testing & documentation

## Key Technologies

- **Terraform:** Infrastructure as Code
- **AWS Services:**
  - VPC (Virtual Private Cloud)
  - ALB (Application Load Balancer)
  - EC2 (Elastic Compute Cloud)
  - RDS (Relational Database Service)
  - Auto Scaling Group
  - Route 53
  - IAM
  - CloudWatch

## Architecture Highlights

- **High Availability:** Multi-AZ deployment across 3 zones
- **Auto Scaling:** Application tier scales 2-6 instances
- **Security:** VPC isolation, Security Groups, encryption
- **Database:** Multi-AZ RDS with automated backups
- **Infrastructure as Code:** 100% Terraform managed

## Getting Started

`ash
# Initialize Terraform
cd terraform
terraform init

# Plan deployment (Dev environment)
terraform plan -var-file=environments/dev.tfvars

# Apply configuration
terraform apply -var-file=environments/dev.tfvars

# Get outputs
terraform output
`

## Expected Outputs

- Load Balancer DNS: http://alb-xxxxx.us-east-1.elb.amazonaws.com
- RDS Endpoint: myapp-db.xxxxx.us-east-1.rds.amazonaws.com
- VPC ID: vpc-xxxxx
- ASG Name: myapp-asg-xxxxx

## Cost Estimation

**Development:**
- 2 t3.medium EC2 instances: ~\/month
- ALB: ~\/month
- RDS t3.micro: ~\/month
- Data transfer: ~\/month
- **Total: ~\/month**

**Production:**
- 4 t3.large EC2 instances (avg): ~\/month
- ALB: ~\/month
- RDS Multi-AZ: ~\/month
- Data transfer: ~\/month
- **Total: ~\/month**

## Success Criteria
```text
✅ All resources created via Terraform
✅ VPC properly configured with subnets
✅ ALB routing traffic to EC2 instances
✅ Auto Scaling Group functioning
✅ RDS database accessible from app tier
✅ High availability verified
✅ All outputs displayed correctly
✅ State management configured
```

## Next Steps

After Day 25:
- Week 6: Microservices with Kubernetes
- Week 7: CI/CD Pipeline
- Week 8: Monitoring & Job Search

