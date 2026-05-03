## VPC (Virtual Private Cloud)

Isolated network in AWS.

Components:
- Subnets: Network segments (public/private)
- Internet Gateway: Internet connectivity
- NAT Gateway: Outbound internet for private
- Route Tables: Traffic routing rules
- Security Groups: Instance-level firewall
- NACLs: Subnet-level firewall

## Security Groups

Instance-level firewall (stateful).

Characteristics:
- Stateful: Allows return traffic automatically
- Allow rules only (no explicit deny)
- Default deny: All traffic blocked by default
- Applied to instances/ENIs

Rules:
- Inbound: Traffic to instance
- Outbound: Traffic from instance

Example Rules:
- Allow port 80 (HTTP) from anywhere
- Allow port 443 (HTTPS) from anywhere
- Allow port 22 (SSH) from admin IP only
- Allow all outbound traffic

Common Security Group Configuration:
- Web tier: Allow 80, 443 from internet
- App tier: Allow 8080 from web tier only
- Database tier: Allow 5432 from app tier only

## Network ACLs (NACLs)

Subnet-level firewall (stateless).

Characteristics:
- Stateless: Must allow return traffic explicitly
- Allow and deny rules
- Numbered rules (evaluated in order)
- Applied to subnets

Difference from Security Groups:
- Security Groups: Stateful, instance-level
- NACLs: Stateless, subnet-level
- Security Groups: More commonly used

Use Cases:
- Additional layer of security
- Deny specific IPs/protocols
- Stateless inspection needed

## VPC Architecture for Security

Layers:
1. Internet Gateway: Entry point
2. Public Subnet: Resources accessible from internet
3. NAT Gateway: Outbound for private resources
4. Private Subnet: No internet access
5. Security Groups: Instance firewall
6. NACLs: Subnet firewall

Tier Separation:
- Web Tier (Public): Web servers
- App Tier (Private): Application servers
- Database Tier (Private): Databases

Traffic Flow:
Internet -> IGW -> Web Tier -> App Tier -> Database Tier

Each tier:
- Separate Security Group
- Restrictive inbound rules
- Principle of least privilege

## VPC Endpoints

Private access to AWS services without internet.

Types:
- Gateway endpoints: S3, DynamoDB
- Interface endpoints: Other services (API Gateway, SNS, SQS)

Benefits:
- No internet gateway needed
- Private connectivity
- No data leaving AWS network
- Reduced data transfer costs

## Private Link

AWS service to establish private connectivity between VPCs.

Use Case: Multi-account architecture with private access

## VPC Flow Logs

Monitor network traffic.

Captures:
- Source/destination IP
- Ports
- Protocol
- Accept/reject

Use Case: Troubleshooting connectivity, security analysis

## VPC Security Best Practices

✅ Use public/private subnet separation
✅ Use Security Groups restrictively
✅ Implement NACLs for additional layer
✅ Use VPC endpoints for AWS services
✅ Enable Flow Logs for monitoring
✅ Regular security group reviews
✅ Document network architecture
✅ Use NAT Gateway for outbound (not NAT Instance)