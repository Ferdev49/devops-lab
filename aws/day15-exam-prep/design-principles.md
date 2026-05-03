## 1. High Availability (HA)

Definition: System operates continuously without interruption.

Key Principles:
- Eliminate single points of failure
- Deploy across multiple Availability Zones
- Use load balancers
- Implement health checks
- Auto-scale based on demand
- Database replication
- Queue-based processing

Example Architecture:
- Route 53 (DNS failover)
- ALB (across AZs)
- Auto Scaling Group
- RDS Multi-AZ
- CloudWatch alarms

Measurement: Uptime percentage (99.9%, 99.99%, etc.)

## 2. Security

Definition: Protect data and systems from unauthorized access.

Key Principles:
- Principle of Least Privilege (PoLP)
- Defense in Depth
- Encrypt data (at rest and in transit)
- Monitor and audit
- Manage secrets securely
- Control network access
- Identify and authenticate

Layers:
- Identity: IAM, MFA
- Network: VPC, Security Groups, NACLs
- Application: Encryption, authentication
- Data: Encryption, access control
- Physical: AWS responsibility

## 3. Performance Efficiency

Definition: Use resources optimally to meet requirements.

Key Principles:
- Right-size resources
- Optimize database
- Use caching
- Use CDN
- Monitor performance
- Adjust as needed

Optimization Areas:
- Compute: EC2 right-sizing, Lambda
- Storage: S3 optimization, EBS
- Database: Read replicas, caching
- Network: CloudFront, Route 53

## 4. Cost Optimization

Definition: Minimize costs while meeting requirements.

Key Principles:
- Measure costs
- Right-size resources
- Choose appropriate purchasing options
- Use managed services
- Optimize storage and data transfer

Cost Reduction Strategies:
1. Compute Savings
   - Reserved Instances (30-70% savings)
   - Spot Instances (up to 90% savings)
   - Scheduled scaling

2. Storage Savings
   - S3 Standard -> Infrequent Access
   - S3 -> S3 Glacier (archive)
   - EBS gp2 -> gp3 (newer)

3. Data Transfer Savings
   - CloudFront (reduce data transfer)
   - VPC endpoints (avoid internet gateway)
   - Cloudping (select closest region)

4. Database Savings
   - Reserved Instances
   - Read replicas for scaling
   - Aurora (cost-effective)

## 5. Operational Excellence

Definition: Run and monitor systems effectively.

Key Principles:
- Automate
- Document
- Monitor
- Improve processes
- Prepare for failures
- Learn from incidents

## Design Trade-offs

### High Availability vs Cost
Trade-off: Multi-AZ = Higher cost
Decision: Balance uptime requirements with budget

### Security vs Performance
Trade-off: Encryption = Slower
Decision: Necessary for data protection

### Simplicity vs Scalability
Trade-off: Simple = Limited scale
Decision: Choose based on growth projections

### On-Premise vs Cloud
Trade-off: Cloud = Different costs
Decision: Cloud for flexibility, on-prem for control

## Exam Perspective

The exam tests your ability to:
1. Recognize requirements
2. Select appropriate services
3. Explain trade-offs
4. Design for multiple concerns
5. Optimize for priorities

Example:
Q: "Design for high availability, security, and cost efficiency"
A: Multi-AZ with Reserved Instances, encryption, monitoring

## Service Selection Matrix

| Requirement | Services |
|------------|----------|
| **HA** | Multi-AZ, ALB, ASG, RDS Multi-AZ |
| **Security** | IAM, VPC, KMS, CloudTrail |
| **Performance** | ElastiCache, CloudFront, Read replicas |
| **Cost** | Reserved Instances, Spot, Glacier |