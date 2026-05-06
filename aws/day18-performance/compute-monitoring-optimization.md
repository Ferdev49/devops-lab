# Compute & Monitoring Optimization - Day 18

## EC2 Instance Right-Sizing

Optimize instance selection.

Considerations:
- CPU requirement
- Memory requirement
- Network requirement
- Storage requirement

Instance Types:
- General: Balanced (t3, m5)
- Compute: High CPU (c5)
- Memory: High RAM (r5)
- Storage: High I/O (i3)

Right-Sizing Process:
1. Monitor actual usage
2. Identify underutilized instances
3. Downsize to smaller instance
4. Savings: 20-70%

CloudWatch for monitoring:
- CPU utilization
- Memory usage
- Network throughput
- Disk I/O

## Lambda Performance

Optimization:
- Increase memory (faster CPU)
- Connection reuse (SDK client outside handler)
- Code optimization (minimize cold start)
- Provisioned Concurrency (warm instances)

Cold Start:
- First invocation: 100-300ms overhead
- Subsequent invocations: Fast

Minimize:
- Keep deployment package small
- Use provisioned concurrency
- Warm up function

## EBS Volume Performance

Volume Types:
- gp2: General purpose (default)
- gp3: General purpose newer (better performance)
- io1: High I/O
- st1: Throughput optimized (HDD)

For Performance:
- Use gp3 or io1 (SSD)
- Increase IOPS
- Increase throughput

Monitoring:
- Volume Read/Write Ops
- Queue Length (latency indicator)

## Network Performance

CloudFront:
- Reduces origin load
- Caches globally
- Faster delivery

Direct Connect:
- Dedicated network connection
- Lower latency
- Consistent performance

VPC Placement:
- Same region/AZ: Lower latency
- Cross-region: Higher latency
- Consider traffic patterns

## Monitoring & Alerting

CloudWatch Metrics to Monitor:
- Application latency
- Database query time
- Cache hit ratio
- Error rate
- Throughput

Set Alarms:
- High latency
- High error rate
- Low cache hit ratio
- Resource saturation

## Application Performance Monitoring (APM)

AWS X-Ray:
- Trace requests through application
- Identify bottlenecks
- Service map visualization

CloudWatch Logs Insights:
- Query application logs
- Find slow requests
- Analyze patterns

## Performance Testing

Load Testing:
- Simulate real traffic
- Identify breaking points
- Capacity planning

Stress Testing:
- Test beyond expected load
- Find limits
- Prepare for spikes

Tools:
- Apache JMeter
- Locust
- Load testing services

## Performance Best Practices

✅ Use CloudFront for static content
✅ Cache database queries
✅ Right-size EC2 instances
✅ Monitor with CloudWatch
✅ Set up alarms for anomalies
✅ Use read replicas for read-heavy workloads
✅ Compress responses
✅ Minimize latency
✅ Load test before production
✅ Monitor continuously

