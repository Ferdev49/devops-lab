# Networking Module Implementation Notes - Day 22

## What We Built

### VPC Architecture
- CIDR: 10.0.0.0/16
- 3 Availability Zones
- 9 total subnets (3 public, 3 private, 3 database)

### Public Subnets (0.0/24, 1.0/24, 2.0/24)
- For Application Load Balancer
- Routes: 0.0.0.0/0 → Internet Gateway
- Auto-assign public IP: Yes

### Private Subnets (11.0/24, 12.0/24, 13.0/24)
- For Application Tier EC2 instances
- Routes: 0.0.0.0/0 → NAT Gateway (same AZ)
- No public IP assignment
- Fault isolation: Each AZ has own NAT Gateway

### Database Subnets (21.0/24, 22.0/24, 23.0/24)
- For RDS Multi-AZ deployment
- Routes: No internet route
- Private only

## Security Groups

### ALB SG
- Inbound: 80, 443 from 0.0.0.0/0
- Outbound: All

### App Tier SG
- Inbound: 80, 443 from ALB SG
- Outbound: All

### Database SG
- Inbound: 5432 (PostgreSQL) from App SG
- Outbound: All

## Key Terraform Concepts Used

1. **Modules:** Networking separated into module for reusability
2. **For Loops:** Creating multiple subnets with count
3. **Outputs:** Exporting VPC/subnet/SG IDs to other modules
4. **Dependencies:** NAT Gateway depends on IGW
5. **default_tags:** Applying tags to all resources

## NAT Gateway Strategy

- One NAT Gateway per AZ
- Each private subnet routes to NAT in same AZ
- Provides fault isolation
- Each NAT has elastic IP

## What's Next (Day 23)

- Load Balancer module
- ALB creation
- Target groups
- Health checks

