# AWS CloudWatch Monitoring - Day 14

## CloudWatch Metrics

Pre-defined metrics from AWS services.

### EC2 Metrics
- CPU Utilization
- Network In/Out
- Disk Read/Write
- Status Check (system and instance)

### ELB Metrics
- Request Count
- Target Response Time
- Healthy/Unhealthy Host Count
- HTTP 4xx/5xx responses

### Custom Metrics
Publish custom application metrics to CloudWatch.

Example: Application error rate, business metrics

## CloudWatch Alarms

Trigger actions based on metric thresholds.

States:
- OK: Metric within threshold
- ALARM: Metric out of threshold
- INSUFFICIENT_DATA: Not enough data points

Actions:
- SNS notification (email, SMS)
- Auto Scaling action
- EC2 action (stop, reboot, terminate)
- Lambda invocation

## CloudWatch Logs

Centralized logging service.

Features:
- Log Groups: Container for related logs
- Log Streams: Sequence of log events
- Log Retention: Keep logs for X days
- Metric Filters: Extract metrics from logs
- Insights: Query logs with SQL-like syntax

## Dashboard

Visualize metrics in real-time.

Components:
- Line charts: Metric trends
- Numbers: Current values
- Pie charts: Proportions
- Heat maps: 2D data visualization

## Application Insights

Monitor application performance.

Metrics:
- Error rate
- Response time
- Throughput
- Database performance

Helps identify:
- Performance bottlenecks
- Availability issues
- Resource constraints

