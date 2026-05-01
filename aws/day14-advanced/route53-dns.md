# AWS Route 53 - Day 14

## What is Route 53?

DNS (Domain Name System) service that translates domain names to IP addresses.

Example: example.com -> 192.0.2.1

## Routing Policies

### Simple Routing
- Single resource
- Most common for single target

### Weighted Routing
- Distribute traffic by weight percentage
- Example: 80% to new version, 20% to old version
- Useful for gradual rollout

### Latency Routing
- Route to lowest latency region
- Example: US users to us-east-1, EU users to eu-west-1

### Failover Routing
- Primary + secondary resources
- Automatic failover if primary unhealthy
- Use for high availability

### Geolocation Routing
- Route based on user location
- Example: Route EU users to EU resources

### Geoproximity Routing
- Route based on geographic proximity
- More fine-grained than geolocation

### Multi-value Answer Routing
- Return multiple healthy IP addresses
- Simple load balancing

## Health Checks

Check if resource is healthy.

Types:
- Endpoint health check (HTTP, TCP, CloudWatch)
- Calculated health check (combination of others)
- CloudWatch alarm check

## TTL (Time To Live)

How long DNS records are cached.

Short TTL (60 seconds): Changes take effect quickly, more DNS queries
Long TTL (3600 seconds): Fewer DNS queries, changes take longer

Lower TTL for frequently changing records
Higher TTL for stable records

## Alias Records (AWS Specific)

Point to AWS resources without additional charge.

Targets:
- CloudFront distribution
- ELB
- S3 website
- Another Route 53 record

