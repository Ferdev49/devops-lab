# Caching Strategy for Performance - Day 18

## Why Caching?

Reduces latency and database load.

Without Cache:
- Client -> Web Server -> Database (slow)
- Database query: 100-500ms

With Cache:
- Client -> Web Server -> Cache (fast, 1-5ms)
- Only cache miss hits database

Result: 10-100x faster responses

## Caching Layers

### 1. Client-Side Caching
Browser caches (HTTP cache headers)

HTTP Headers:
- Cache-Control: How long to cache
- Expires: When cache expires
- ETag: Content version identifier

Example:
Cache-Control: max-age=3600 (cache 1 hour)

### 2. Application Caching
In-memory cache in application

Use: Session data, frequently accessed objects

Problem: Only local instance has cache

### 3. Distributed Cache (ElastiCache)
Shared cache for all application instances

Services:
- Redis: Advanced, sorted sets, pub/sub
- Memcached: Simple, fast key-value

Redis vs Memcached:
- Redis: Complex data types, persistence, replication
- Memcached: Simple, ultra-fast, no persistence

Use Case: Database query results, session store

### 4. CDN Cache (CloudFront)
Cache at edge locations worldwide

Serves content from closest edge location

Fast delivery worldwide

## ElastiCache Implementation

### Redis
Advanced in-memory data store.

Features:
- Strings, Lists, Sets, Sorted Sets, Hashes
- Pub/Sub messaging
- Transactions
- Persistence options

Use Cases:
- Cache database queries
- Session store
- Real-time analytics
- Message queue

Cluster Modes:
- Disabled: Single node or primary-replica
- Enabled: Cluster of shards (auto-sharding)

### Memcached
Simple key-value cache.

Features:
- Simple strings and objects
- No persistence
- Ultra-fast
- Horizontal scaling

Use Cases:
- Simple caching
- Session cache
- Database query cache

## Caching Strategies

### Cache-Aside (Lazy Loading)
Application checks cache first.

Flow:
1. Check cache
2. If miss, query database
3. Store in cache
4. Return to client

Pros: Flexible, only cache needed data
Cons: Cache miss hits database

### Write-Through
Write to cache and database together.

Flow:
1. Write to cache
2. Write to database
3. Return to client

Pros: Cache always up-to-date
Cons: Write latency

### Write-Behind (Write-Back)
Write to cache immediately, database asynchronously.

Flow:
1. Write to cache
2. Return immediately (before database write)
3. Background job writes to database

Pros: Fast writes
Cons: Data loss risk if cache crashes

## TTL (Time To Live)

How long data stays in cache before expiring.

Short TTL (1 hour): Fresh data, more database hits
Long TTL (24 hours): Fewer database hits, stale data

Balance based on:
- Data freshness requirement
- Database load
- Cache size

Example:
- User profile: 1 hour TTL
- Product catalog: 24 hour TTL
- Real-time data: No cache

## Cache Eviction

When cache is full, what data to remove?

Policies:
- LRU (Least Recently Used): Remove oldest accessed
- LFU (Least Frequently Used): Remove least popular
- Random: Remove random item
- TTL: Remove expired items

Redis uses: LRU or LFU (configurable)
Memcached uses: LRU

## Cache Invalidation

Remove stale data from cache.

Strategies:
1. TTL expiration (automatic)
2. Manual deletion (app logic)
3. Event-based (publish-subscribe)
4. Cache-aside (lazy load)

Hardest problem in computer science: Cache invalidation

## Performance Monitoring

CloudWatch metrics:
- CPU utilization
- Network bytes in/out
- Cache hits/misses
- Evictions

Alarms:
- High CPU
- Low cache hit ratio
- High evictions

## Best Practices

✅ Use cache for frequently accessed data
✅ Set appropriate TTL
✅ Monitor cache hit ratio (aim for >80%)
✅ Handle cache misses gracefully
✅ Use Redis for complex data, Memcached for simple
✅ Warm up cache on startup
✅ Test cache invalidation
✅ Monitor cache size

