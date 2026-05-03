## What is High Availability?

System operates continuously without interruption despite failures.

Metrics:
- 99.9% uptime = 8.7 hours downtime/year
- 99.99% uptime = 52 minutes downtime/year
- 99.999% uptime = 5 minutes downtime/year

## Single Points of Failure

Avoid: Single availability zone, single instance, single database

Example of Failures:
- Hardware failure: Disk dies
- Availability Zone outage: Power failure, network issue
- Networking: Internet gateway fails
- Software: Application crash
- Human error: Misconfiguration

## Multi-AZ Deployment

Deploy across multiple Availability Zones.

Each AZ has:
- Separate power supplies
- Separate cooling systems
- Separate networking
- Separate data centers

If one AZ fails, others continue operating.

## Load Balancing

Distribute traffic across multiple instances.

Types:
- ALB (Application): Layer 7, application-level routing
- NLB (Network): Layer 4, extreme performance
- ELB (Classic): Legacy, not recommended

Load Balancer Features:
- Health checks: Remove unhealthy instances
- Session affinity: Keep user on same instance
- Multiple AZ: Distribute across zones
- Auto-scaling: Add/remove instances

## Auto Scaling

Automatically adjust instance count based on demand.

Components:
- Launch Template: Instance configuration
- Auto Scaling Group: Manages instances
- Scaling Policy: Rules for scaling

Scaling Policy Types:
- Target Tracking: Maintain metric at target (e.g., CPU 70%)
- Step Scaling: Scale based on metric ranges
- Scheduled Scaling: Scale on schedule

## RDS Multi-AZ

Database replication across availability zones.

Features:
- Synchronous replication: Primary writes, standby reads
- Automatic failover: ~1-2 minutes
- No manual intervention required
- Primary and standby in different AZs

Limits:
- Can only failover, not scale reads
- Additional cost (roughly 2x single-AZ)

For read scaling: Use Read Replicas

## Read Replicas (RDS)

Asynchronous replication for read scaling.

Characteristics:
- Asynchronous replication: Slight lag possible
- In same region or different regions
- Can be promoted to standalone database
- Can have cascading replicas

Use case: Read-heavy workloads

## Route 53 Health Checks

Monitor endpoint health.

Types:
- HTTP/HTTPS health check: GET request
- TCP health check: TCP connection
- CloudWatch alarm: Based on metric
- Calculated: Combination of others

Failover Routing:
- Primary resource
- Secondary resource (failover)
- Automatic failover on health check failure

## Availability vs Reliability

Availability: System is up and running
Reliability: System works correctly

Example:
- Available but not reliable: System up but returns wrong data
- Reliable but not available: System correct but frequently down

Need both for quality service.

## HA Architecture Pattern

Components:
- Route 53: DNS with failover
- ALB: Load balance across AZs
- Auto Scaling Group: Multiple instances across AZs
- RDS Multi-AZ: Database with failover
- CloudWatch: Monitor and alert

Result:
- No single point of failure
- Automatic failover
- Automatic scaling
- Self-healing (restart failed instances)
- 99.99%+ uptime possible

## Designing for High Availability

Checklist:
✅ Multi-AZ deployment
✅ No single point of failure
✅ Load balancer for traffic distribution
✅ Auto Scaling for capacity management
✅ Health checks enabled
✅ Database replication (Multi-AZ or Read Replicas)
✅ Monitoring and alerting
✅ Automated failover
✅ Testing failure scenarios

## Common HA Mistakes

❌ Single AZ deployment
❌ No load balancer
❌ No Auto Scaling
❌ No health checks
❌ Database without redundancy
❌ No monitoring
❌ Manual failover process
❌ Untested recovery procedures