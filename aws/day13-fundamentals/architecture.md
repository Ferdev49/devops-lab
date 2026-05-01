# AWS Architecture Examples - Day 13

## High Availability Web Application

Architecture:
- Users access through Route 53 (DNS)
- Traffic goes to ALB (Application Load Balancer) in multiple AZs
- ALB distributes to EC2 instances in Auto Scaling Group
- EC2 instances connect to RDS Multi-AZ database
- S3 stores static content
- CloudFront serves content globally

Components:
- Route 53: DNS service
- ALB: Load balancer across AZs
- EC2: Web/app servers (auto-scaled)
- RDS: Database (Multi-AZ for HA)
- S3: Static content
- CloudFront: CDN

Benefits:
- High Availability (AZ failure tolerant)
- Auto Scaling (handles traffic spikes)
- Database High Availability (Multi-AZ failover)
- Global content distribution (CloudFront)

## Three-Tier Architecture

Layer 1 - Web Tier:
- ALB for load balancing
- EC2 instances for web servers

Layer 2 - Application Tier:
- EC2 instances for business logic
- Auto Scaling Group

Layer 3 - Database Tier:
- RDS database
- Multi-AZ for redundancy
- Read replicas for scaling reads

Communication:
- Security Groups control traffic between tiers
- Private subnets for app and database tiers
- Only web tier in public subnet

## Serverless Architecture

Components:
- API Gateway: REST API endpoint
- Lambda: Serverless functions
- DynamoDB: NoSQL database
- S3: Static content and backups

Benefits:
- No servers to manage
- Auto-scaling built-in
- Pay per execution
- High availability by default

## Cost Optimization Strategies

1. Right-sizing: Use appropriate instance types
2. Reserved Instances: Commit to 1-3 years for discount
3. Spot Instances: Bid for unused capacity (up to 90% discount)
4. Auto Scaling: Scale down when not needed
5. S3 Lifecycle: Move old data to cheaper storage
6. CloudFront: Reduce data transfer costs

## Security Best Practices

1. IAM:
   - Principle of least privilege
   - Use roles instead of access keys
   - Enable MFA

2. Network:
   - Use Security Groups
   - Use NACLs for additional control
   - Use VPN/VPC endpoints for private access

3. Encryption:
   - Data in transit (TLS/SSL)
   - Data at rest (KMS)

4. Monitoring:
   - CloudTrail for audit logs
   - CloudWatch for metrics
   - Config for compliance

