$lbNotes = "# Load Balancer Module Implementation - Day 23

## What We Built

### Application Load Balancer (ALB)
- Name: \${app_name}-alb
- Type: Application Layer (Layer 7)
- Subnets: Public subnets across 3 AZ
- Security Group: ALB SG (HTTP/HTTPS)

### Features Enabled
- HTTP/2 support
- Cross-zone load balancing
- Connection draining
- Deletion protection: Disabled (for testing)

### Target Group
- Name: \${app_name}-tg
- Port: 80 (HTTP)
- Protocol: HTTP
- Target type: Instance
- VPC: Same VPC as app tier

### Health Checks
- Path: / (root)
- Interval: 30 seconds
- Timeout: 5 seconds
- Healthy threshold: 2 consecutive successes
- Unhealthy threshold: 2 consecutive failures
- Success matcher: HTTP 200

Result: Instance considered healthy after 60 seconds, unhealthy after 60 seconds

### Listener
- Port: 80 (HTTP)
- Protocol: HTTP
- Default action: Forward to target group
- Rules: None yet (Day 24 adds EC2 instances)

### Sticky Sessions
- Enabled: Duration cookie (24 hours)
- Effect: Client requests go to same instance within 24h
- Use case: Session state on single instance

## ALB Advantages

✅ Layer 7 routing (HTTP/HTTPS aware)
✅ Path-based routing (/api vs /web)
✅ Host-based routing (example.com vs api.example.com)
✅ Header-based routing
✅ Query string routing
✅ Source IP routing
✅ SSL/TLS termination
✅ WebSocket support

## Health Check Strategy

Why health checks matter:
- Detect unhealthy instances
- Remove from rotation automatically
- Prevent user requests to failing servers
- Enable self-healing

Health check flow:
1. ALB sends HTTP GET / every 30s
2. Instance must respond with HTTP 200 within 5s
3. If 2 checks pass → Instance marked healthy
4. If 2 checks fail → Instance marked unhealthy
5. Unhealthy instances don't receive traffic

## Testing Health Checks

On instances (Day 24), ensure:
- Port 80 is listening
- HTTP / responds with 200
- Response time < 5 seconds

Example HTTP response:
HTTP/1.1 200 OK
Content-Type: text/html
Application is running

## What's Missing (For Now)

- No EC2 instances registered yet (Day 24)
- No HTTPS/SSL (optional)
- No path-based rules
- No host-based rules
- No access logs

These will be added in future days if needed.

## Architecture So Far
```text
Internet
↓
Route 53 (optional)
↓
ALB (Public Subnets)
├── HTTP Listener (port 80)
└── Target Group (port 80)
↓
[No targets yet - EC2 instances on Day 24]
```

## Outputs for Next Module (App Tier)

Day 24 (App Tier Module) will need:
- target_group_arn: For ASG to register instances
- alb_url: For testing
- target_port: What port to listen on

All outputs provided by load_balancer module.

## Cost Implications

ALB costs:
- Fixed hourly charge: ~\$20/month
- LCU (Load Capacity Units): ~\$5-10/month
- Data transfer: Included in AWS

Total ALB cost: ~\$25-30/month

## Next Steps (Day 24)

1. Create EC2 instances in private subnets
2. Register instances with target group
3. Setup Auto Scaling Group
4. Test health checks
5. Monitor ALB traffic