# AWS Auto Scaling - Day 14

## Auto Scaling Group (ASG)

Automatically scales EC2 instances based on demand.

### Components
1. Launch Template: Instance configuration (AMI, instance type, security groups)
2. Auto Scaling Group: Desired, minimum, maximum capacity
3. Scaling Policy: Rules for scaling up/down

### Configuration

Min Capacity: Minimum running instances (for high availability)
Desired Capacity: Target number of instances
Max Capacity: Maximum to prevent cost overruns

Example:
- Min: 2 (high availability)
- Desired: 4 (normal load)
- Max: 10 (spike protection)

## Scaling Policies

### Target Tracking Scaling
- Maintain metric at target value
- Example: Keep CPU at 70%
- Simplest to use

### Step Scaling
- Scale based on metric ranges
- Example: If CPU > 80%, add 2 instances

### Scheduled Scaling
- Scale on fixed schedule
- Example: Add capacity at 9am, reduce at 6pm

## Health Checks

Types:
- EC2 Health Check: Instance status
- ELB Health Check: Application health

Failed health check -> instance replaced automatically

Replacement time: 5 minutes (default)

## Lifecycle Hooks

Execute custom actions during scaling events.

Examples:
- Graceful shutdown before termination
- Data sync before instance launch
- Connection draining before removal

## Best Practices

✅ Use Launch Templates (not Launch Configurations)
✅ Set min > 1 for high availability
✅ Use health checks
✅ CloudWatch monitoring
✅ Test scaling policies
✅ Gradual rollout of new AMI versions

