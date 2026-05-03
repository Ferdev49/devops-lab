## Auto Scaling Group (ASG)

Maintains desired number of EC2 instances.

Configuration:
- Min Size: Minimum instances (for HA)
- Desired Capacity: Target number
- Max Size: Maximum limit (cost protection)

Example: Min 2, Desired 4, Max 10

## Launch Template

Instance configuration for ASG.

Includes:
- AMI (Amazon Machine Image)
- Instance type
- Security groups
- IAM role
- User data script
- Storage configuration

Modern alternative to Launch Configuration (deprecated)

## Scaling Policies

### Target Tracking Scaling (Recommended)

Maintain metric at target value.

Example: Keep CPU Utilization at 70%

How it works:
1. CloudWatch monitors CPU
2. If CPU exceeds 70%: Add instances
3. If CPU below 70%: Remove instances
4. Automatically adjusts

Simple and effective for most workloads.

### Step Scaling

Respond to metric in ranges.

Example:
- CPU 70-80%: Add 1 instance
- CPU 80-90%: Add 2 instances
- CPU >90%: Add 4 instances

More granular control but more complex.

### Scheduled Scaling

Scale on schedule.

Example:
- 9am weekday: Scale to 8 instances
- 6pm weekday: Scale to 2 instances
- Weekend: Scale to 1 instance

Use for predictable traffic patterns.

## Health Checks

### EC2 Health Check (Default)

Instance status checks:
- System status (hardware)
- Instance status (software)

If failed: Terminate and replace

### ELB Health Check

Application-level health check via HTTP/HTTPS.

If application not responding: Terminate and replace

More accurate than EC2 checks for application health.

## Lifecycle Hooks

Execute custom actions during scaling events.

On Launch:
- Install monitoring agent
- Sync data from S3
- Warm up cache

On Termination:
- Graceful shutdown
- Drain connections
- Final log upload
- Health check drain

Prevents data loss and service disruption.

## Termination Policy

Which instance to terminate during scale-down:

Policies:
- Default: Oldest launch template, oldest instance
- AllocationStrategy: Balance across AZs
- OldestLaunchTemplate
- OldestInstance
- ClosestToNextInstanceHour

Default usually best for cost optimization.

## Cooldown Period

Wait time after scaling action before next scaling.

Default: 300 seconds (5 minutes)

Prevents scaling back-and-forth (thrashing).

Longer cooldown: More stable but slower response
Shorter cooldown: Faster response but may thrash

## ASG Across Multiple AZs

Distribute instances across availability zones.

Benefit: Automatic AZ failover

Example:
- Desired: 6 instances
- AZs: us-east-1a, us-east-1b, us-east-1c
- Result: 2 instances per AZ

ASG automatically replaces instances in failed AZ.

## Warm-up Period

Time for new instance to become fully operational.

During warm-up:
- CloudWatch metrics ignored
- Instance boots up
- Application starts
- Cache warms up

Prevents premature scaling decisions.

Example: 300 seconds warm-up for app startup + cache warm.

## ASG Metrics

Monitor ASG health:

Metrics:
- GroupDesiredCapacity: Target instances
- GroupInServiceInstances: Running instances
- GroupTerminatingInstances: Terminating instances
- GroupTotalInstances: All instances

CloudWatch alarms on these metrics:

Example: Alert if running < desired (indicates failures)

## Cost Optimization with ASG

- Set Max Size: Prevents runaway costs
- Use Spot Instances: Up to 90% savings
- Right-size instances: Use appropriate type
- Scheduled scaling: Down when not needed
- Reserved Instances for baseline capacity

Example:
- Baseline: 2 Reserved Instances (min)
- Peak: 8 On-Demand Instances (for spikes)
- Save 70% vs all On-Demand