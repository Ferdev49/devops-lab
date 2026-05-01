# AWS Load Balancing - Day 14

## Elastic Load Balancer (ELB) Types

### Application Load Balancer (ALB)
- Best for: Web applications, microservices
- Features:
  - Host-based routing (example.com vs api.example.com)
  - Path-based routing (/api vs /images)
  - Container support
  - HTTP/HTTPS
- Use when: Application-level decisions needed

### Network Load Balancer (NLB)
- Best for: High performance, non-HTTP protocols
- Features:
  - Extreme performance (millions of requests/sec)
  - Low latency
  - TCP/UDP support
  - IP protocol support
- Use when: Gaming, IoT, non-HTTP protocols

### Classic Load Balancer (Legacy)
- Older generation, not recommended
- Use ALB or NLB instead

## How Load Balancing Works

1. Client sends request to load balancer
2. Balancer distributes to healthy backend instances
3. Health checks ensure instances are healthy
4. Unhealthy instances are removed from rotation
5. Healthy instances are added automatically

## Sticky Sessions

Session affinity - requests from same client go to same target.

Use when: Session data stored locally on instance
Avoid when: Can use shared session store (Redis, DynamoDB)

## Target Groups

Group of backend instances that receive traffic from load balancer.

Features:
- Health check configuration
- Stickiness settings
- Deregistration delay
- Protocol and port settings

## Cross-Zone Load Balancing

Distribute traffic across AZs evenly instead of by instance count.

Enabled by default on ALB
Disabled by default on NLB (extra cost to enable)

