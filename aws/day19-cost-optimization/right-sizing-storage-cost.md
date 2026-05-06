# Right-Sizing & Storage Cost Optimization - Day 19

## Right-Sizing Process

### Step 1: Gather Metrics
CloudWatch metrics over 2-4 weeks:
- CPU utilization
- Memory usage
- Network throughput
- Disk I/O

Look for patterns:
- Consistent low usage (right-size down)
- Consistent high usage (up-size or add horizontal)
- Bursty usage (use auto-scaling)

### Step 2: Analyze Utilization
Low utilization instances (candidates for downsizing):
- CPU avg <20%: Likely over-sized
- Memory avg <30%: Likely over-sized
- Network <5%: Very under-utilized

High utilization:
- CPU avg >70%: Consider larger
- Memory avg >80%: Consider larger
- Scale horizontally if possible

### Step 3: Test & Validate
1. Create smaller instance
2. Run workload
3. Monitor performance
4. Keep if acceptable, revert if issues

### Step 4: Iterate
Repeat process quarterly as workload changes.

## Instance Type Selection Guide

General Purpose (Default):
- t3, m5, m6i families
- Balanced CPU, memory, network
- Web servers, small databases
- Cost: Medium

Compute Optimized:
- c5, c6i families
- High CPU
- Batch processing, ML inference
- Cost: Medium-High

Memory Optimized:
- r5, r6i families
- High RAM
- Large databases, in-memory caches
- Cost: High

Storage Optimized:
- i3, i4i families
- High I/O
- Databases with heavy I/O
- Cost: High

Burstable (Savings):
- t3, t3a families
- Savings plans available
- Web applications, small workloads
- Cost: Low

Right-sizing: Use smallest instance that meets requirements

## Storage Cost Optimization

### S3 Storage Classes

S3 Standard:
- Frequently accessed
- \.023/GB/month
- No retrieval cost

S3 Intelligent-Tiering:
- Automatic optimization
- Moves between tiers
- \.0125/GB/month (avg)

S3 Standard-IA (Infrequent Access):
- Infrequent access (>30 days)
- \.0125/GB/month
- \.01/1000 GET requests

S3 Glacier:
- Archive (>90 days)
- \.004/GB/month
- Retrieval: 1-5 minutes

S3 Deep Archive:
- Long-term archive (>180 days)
- \.00099/GB/month
- Retrieval: 12 hours

### Strategy
1. New objects: S3 Standard
2. After 30 days: Move to Standard-IA
3. After 90 days: Move to Glacier
4. After 180 days: Move to Deep Archive

Use S3 Lifecycle Policies for automation

### Cost Example
100GB stored for 1 year:
- Standard only: \.60
- With Intelligent-Tiering: \/month avg = \
- With Lifecycle: ~\

## EBS Cost Optimization

Volume Types:
- gp2: General purpose (\.10/GB/month)
- gp3: Newer, better (\.08/GB/month)
- io1: High I/O (\.125/GB + \.065/IOPS)

Optimization:
- Use gp3 instead of gp2 (20% savings)
- Reduce volume size if possible
- Delete unused snapshots
- Delete unattached volumes

## Database Cost Optimization

RDS:
- Use Aurora instead of standard RDS (10x faster, 60% cheaper)
- Reserved Instances for production
- Multi-AZ only when needed

DynamoDB:
- Use On-Demand for variable workloads
- Use Provisioned for steady workloads
- Reserved capacity for production

## Data Transfer Cost Optimization

Expensive:
- Data transfer out (egress): \.02/GB

Optimization:
- CloudFront caching (reduce egress)
- S3 Transfer Acceleration (faster, extra cost)
- VPC endpoints (avoid internet)
- Same-region transfers (free)

Example:
- 1TB daily egress: \/month
- With CloudFront 90% cache hit: \/month (90% savings)

## Cost Optimization Best Practices

✅ Reserved Instances for predictable workloads
✅ Spot Instances for variable workloads
✅ Right-size instances based on metrics
✅ Use S3 Lifecycle Policies
✅ Monitor with Cost Explorer
✅ Set budgets and alerts
✅ Remove unused resources monthly
✅ Automate cost optimization
✅ Review quarterly
✅ Train team on cost awareness

