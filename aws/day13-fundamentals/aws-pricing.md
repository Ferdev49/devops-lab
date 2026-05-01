# AWS Pricing & Cost Optimization - Day 13

## EC2 Pricing Models

### On-Demand
- Pay per hour used
- No commitment
- Most expensive
- Best for: Unpredictable workloads, testing

### Reserved Instances
- Commit to 1 or 3 years
- 30-70% discount vs On-Demand
- Can be converted or sold in Marketplace
- Best for: Steady-state workloads, production

### Spot Instances
- Bid for unused capacity
- Up to 90% discount
- Can be interrupted
- Best for: Batch jobs, non-critical workloads

### Savings Plans
- Commitment to dollar amount
- More flexible than Reserved Instances
- Works across instance families
- 30-70% discount

## S3 Pricing

- Storage: per GB per month
- Data Transfer: egress (outbound) charged
- Requests: per 1000 requests
- Different storage classes for different costs

### Cost Optimization for S3
- Use S3 Standard for frequent access
- Use S3 Infrequent Access for infrequent data
- Use S3 Glacier for archival
- Enable versioning only if needed
- Use S3 Lifecycle policies

## RDS Pricing

- Per hour (or per second with Aurora)
- Based on instance type and size
- Data transfer costs
- Backup storage costs

### Cost Optimization for RDS
- Use Reserved Instances for production
- Use Aurora for cost-effective database
- Enable automated backups (included)
- Monitor and optimize queries

## Free Tier

- 12 months of free tier when you sign up
- 750 EC2 hours per month (t2.micro)
- 5GB S3 storage
- Database options
- Many other services

## Estimated Costs

Example: Small web application
- 2 x t2.micro EC2: ~\/month (On-Demand)
- 20GB S3: ~\/month
- RDS db.t3.micro: ~\/month
- Data transfer: ~\/month
- Total: ~\/month

With Reserved Instances: ~\/month (43% savings)

## Cost Management Tools

1. AWS Cost Explorer: Analyze spending
2. AWS Budgets: Set spending alerts
3. AWS Trusted Advisor: Optimization recommendations
4. CloudWatch: Monitor usage

