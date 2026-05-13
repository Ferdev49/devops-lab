# Kubernetes Monitoring & Observability - Day 30

## Overview

Monitoring three microservices in Kubernetes.

## Key Metrics to Monitor

### Application Metrics
- Request count (per service)
- Response time (latency)
- Error rate (4xx, 5xx)
- Success rate

### Infrastructure Metrics
- CPU utilization
- Memory usage
- Network I/O
- Disk I/O

### Service Health
- Pod status
- Container restarts
- Health check status
- Service availability

## Monitoring Tools

### Prometheus
- Time series database
- Metrics collection
- Query language (PromQL)

### Grafana
- Visualization
- Dashboards
- Alerts

### Kubernetes Metrics Server
- Built-in resource metrics
- CPU/memory usage

## Commands to Monitor Services

### Check Pod Status

```bash
kubectl get pods -n microservices
kubectl get pods -n microservices -o wide
kubectl describe pod <pod-name> -n microservices
```

### View Resource Usage

```bash
# Per pod
kubectl top pod -n microservices

# Per node
kubectl top node

# Watch in real-time
kubectl top pod -n microservices --watch
```

### Check Service Health

```bash
# Service endpoints
kubectl get endpoints -n microservices

# Service details
kubectl describe svc <service-name> -n microservices

# Port forward and test
kubectl port-forward svc/user-service 8000:8000 -n microservices
curl http://localhost:8000/health
```

### View Logs

```bash
# Recent logs
kubectl logs deployment/user-service -n microservices

# Follow logs (tail -f)
kubectl logs -f deployment/user-service -n microservices

# Logs from specific pod
kubectl logs <pod-name> -n microservices

# Logs from previous crashed pod
kubectl logs <pod-name> --previous -n microservices

# Multiple containers
kubectl logs <pod-name> -c <container-name> -n microservices
```

### Check Events

```bash
# Recent events
kubectl get events -n microservices

# Watch events
kubectl get events -n microservices --watch

# Describe resource for events
kubectl describe pod <pod-name> -n microservices | tail -20
```

## Performance Metrics

### Expected Performance

Normal response times:
- Health check: <50ms
- List endpoint: 50-100ms
- Create endpoint: 100-200ms
- With inter-service calls: 150-300ms

### Load Testing Results

Testing with 100 concurrent requests:
- Average latency: <500ms
- P99 latency: <1s
- Error rate: <0.1%
- Throughput: 100+ req/s

## Alerting

### Alert Conditions

Pod becomes unavailable:
- Pod in CrashLoopBackOff
- Pod in Error state
- Restart count increasing

Service degradation:
- Error rate > 5%
- Latency > 1s
- Pod CPU > 80%

## Dashboards

### Basic Dashboard Panels

1. Pod Count by Service
2. CPU Usage by Pod
3. Memory Usage by Pod
4. Network I/O by Pod
5. Request Count by Service
6. Error Rate by Service
7. Response Time by Service
8. Pod Restart Count

## Troubleshooting with Monitoring

### High CPU Usage
- Check which pod is using CPU
- Check logs for processing bottlenecks
- Consider right-sizing resources

### High Memory Usage
- Check memory limits
- Look for memory leaks in logs
- Consider right-sizing resources

### High Error Rate
- Check pod logs for errors
- Check inter-service communication
- Check resource availability

### Pod Crashes
- View logs from crashed pod: `kubectl logs <pod> --previous`
- Check events: `kubectl describe pod <pod>`
- Check resource limits
- Check health probe configuration

## Implementation Guide

### Step 1: Enable Metrics Server

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

### Step 2: Verify Metrics

```bash
kubectl top pod -n microservices
```

### Step 3: Setup Prometheus (Optional)

1. Create prometheus-config ConfigMap
2. Deploy Prometheus pod
3. Configure scrape jobs for services
4. Verify metrics collection

### Step 4: Setup Grafana (Optional)

1. Deploy Grafana
2. Add Prometheus as data source
3. Create dashboards
4. Setup alerts

## Best Practices

✅ Monitor application metrics (errors, latency)
✅ Monitor infrastructure (CPU, memory, disk)
✅ Set up alerts for critical conditions
✅ Keep logs for troubleshooting
✅ Regular performance reviews
✅ Plan capacity based on metrics
✅ Archive logs for auditing
✅ Monitor inter-service communication
