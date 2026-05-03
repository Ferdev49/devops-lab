## Topics
- Multi-AZ deployment patterns
- Eliminating single points of failure
- Load balancing and auto-scaling
- Database high availability
- Health checks and failover
- RTO and RPO concepts

## Project Files

- **multi-az-architecture.md**: Multi-AZ patterns and design
- **database-high-availability.md**: RDS Multi-AZ, Read Replicas, DynamoDB
- **auto-scaling-deep-dive.md**: ASG, scaling policies, lifecycle hooks
- **ha-design-scenarios.md**: Real-world HA architecture scenarios

## Key HA Services

| Service | Purpose |
|---------|---------|
| **Route 53** | DNS with health checks |
| **ALB/NLB** | Load balancing |
| **Auto Scaling** | Dynamic capacity |
| **RDS Multi-AZ** | Database failover |
| **CloudWatch** | Monitoring |
| **ELB Health Checks** | Application health |

## HA Design Checklist

✅ Multi-AZ deployment
✅ No single points of failure
✅ Load balancer configured
✅ Auto Scaling enabled
✅ Health checks active
✅ Database Multi-AZ or replicas
✅ Monitoring and alerting
✅ Tested failover procedures

## Uptime SLA

- 99.9% = 8.7 hours downtime/year
- 99.99% = 52 minutes downtime/year
- 99.999% = 5 minutes downtime/year

## Next Steps

- Day 17: Design for Security
- Days 18-19: Performance & Cost
- Day 20: Practice Exams