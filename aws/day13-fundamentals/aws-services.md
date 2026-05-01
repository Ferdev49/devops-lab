# AWS Fundamentals - Day 13

## EC2 (Elastic Compute Cloud)

Virtual machines in the cloud.

### Features
- On-demand computing capacity
- Flexible sizing (t2.micro to large instances)
- Pay per hour
- Multiple instance types (compute, memory, storage optimized)

### Use Cases
- Web servers
- Application servers
- Database servers
- Batch processing

## S3 (Simple Storage Service)

Object storage service for any amount of data.

### Features
- Unlimited storage
- Object-level storage (not file system)
- Highly available and durable
- Versioning and lifecycle policies
- Access control and encryption

### Use Cases
- Website content storage
- Data backup
- Data lakes
- Static file hosting

## RDS (Relational Database Service)

Managed relational database service.

### Supported Databases
- PostgreSQL
- MySQL
- MariaDB
- Oracle
- SQL Server

### Features
- Automated backups
- Multi-AZ deployment for high availability
- Automated failover
- Read replicas
- Managed patching

### Use Cases
- Production databases
- Data warehousing
- Real-time analytics
- Transactional applications

## IAM (Identity & Access Management)

Control access to AWS resources.

### Components
- Users: Individual accounts
- Groups: Collections of users
- Roles: For services and cross-account access
- Policies: Define permissions

### Best Practices
- Use IAM users (not root account)
- Principle of least privilege
- Enable MFA
- Regular access reviews
- Use roles for services

## VPC (Virtual Private Cloud)

Isolated network in the cloud.

### Components
- Subnets: Network segments
- Internet Gateway: Internet connectivity
- NAT Gateway: Outbound internet for private subnets
- Security Groups: Firewall rules
- Network ACLs: Subnet-level firewall

## Regions & Availability Zones

- **Region**: Geographic area (us-east-1, eu-west-1)
- **Availability Zone**: Data center within region (us-east-1a, us-east-1b)

For high availability, deploy across multiple AZs.

## Auto Scaling

Automatically adjust number of EC2 instances based on demand.

### Components
- Launch Template: Instance configuration
- Auto Scaling Group: Manages instances
- Scaling Policies: Rules for scaling

## AWS Architecture Example

Web application with high availability:
- ALB (Load Balancer) across multiple AZs
- EC2 instances in Auto Scaling Group
- RDS Multi-AZ database
- S3 for static content
- CloudFront for CDN
- IAM for security

## Solutions Architect Exam Focus

- Designing highly available systems
- Designing secure systems
- Designing cost-optimized systems
- Designing performance-optimized systems

### Key Principles
1. Availability
2. Security
3. Performance
4. Cost optimization

## Next Steps

Day 14: Advanced AWS concepts
Days 15-20: Solutions Architect exam preparation

