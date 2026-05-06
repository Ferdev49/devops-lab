# CloudFront & CDN - Day 18

## What is a CDN?

Content Delivery Network - serves content from locations near users.

Traditional:
- User in Tokyo: Fetches from US (high latency, slow)

CDN:
- User in Tokyo: Fetches from Tokyo edge location (low latency, fast)

## CloudFront Overview

AWS CDN service.

Features:
- Global edge locations (200+ worldwide)
- DDoS protection
- SSL/TLS encryption
- Static and dynamic content
- AWS origin integration

Origins:
- S3 bucket
- EC2 instance
- ELB
- Custom HTTP endpoint

## CloudFront Cache Behavior

Origin Request:
1. User requests content
2. Edge location checks cache
3. If miss, request from origin
4. Response cached at edge
5. Served to user

Cache Hit:
1. User requests content
2. Edge location serves from cache
3. Fast response

Cache Invalidation:
- Manual: Invalidate specific objects
- TTL: Objects expire after TTL
- Query strings: Different versions for same path

## CloudFront vs S3 Static Website

S3 Static Website:
- S3 origin accessible worldwide
- No caching at edge
- Slow for distant users
- Lower cost

CloudFront + S3:
- CloudFront in front of S3
- Caches at edge locations
- Fast for all users
- Higher cost (CloudFront charges)

Recommendation: Always use CloudFront in front of S3

## Cache Headers

Control CloudFront caching behavior.

HTTP Headers from Origin:
- Cache-Control: How long to cache
- Expires: Expiration date
- Last-Modified: When content changed
- ETag: Content version

CloudFront respects these headers.

Example:
Cache-Control: max-age=86400 (cache 1 day)

## Caching for Dynamic Content

API responses:
- Cache based on query parameters
- Short TTL (few seconds)
- Invalidate on data changes

HTML pages:
- Vary by Host, User-Agent, Cookie
- Short TTL (few minutes)
- Serve stale on origin error

## CloudFront Security

SSL/TLS Encryption:
- HTTPS between user and edge
- HTTPS between edge and origin
- Free AWS Certificate Manager certificates

Signed URLs/Signed Cookies:
- Restrict access to authenticated users
- Time-limited access
- Prevent direct S3 access

Origin Access Identity:
- Only allow CloudFront to access S3
- Block direct S3 access
- Enforce CloudFront usage

## CloudFront Monitoring

CloudWatch Metrics:
- Requests
- Data transferred (in/out)
- Error rate (4xx, 5xx)
- Cache hit ratio

Alarms:
- High error rate
- Low cache hit ratio
- High origin latency

## Performance Optimization

Compression:
- Enable gzip compression
- Reduce response size (90% reduction possible)

Minimization:
- Minimize CSS/JavaScript
- Remove unused code
- Reduce object size

Image Optimization:
- Use appropriate formats (WebP, AVIF)
- Responsive images
- Lazy loading

Protocol:
- HTTP/2 or HTTP/3
- Multiplexing
- Header compression

## CDN Best Practices

✅ Use CloudFront for static content
✅ Set appropriate Cache-Control headers
✅ Monitor cache hit ratio (aim for >90%)
✅ Compress content
✅ Use signed URLs/cookies for restricted content
✅ Enable Origin Access Identity
✅ Test cache invalidation
✅ Use Query string forwarding when needed
✅ Monitor origin latency
✅ Plan for DDoS (CloudFront helps)

