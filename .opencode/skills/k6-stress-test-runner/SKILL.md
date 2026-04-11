# k6 Stress Test Runner

## Purpose
Run k6 stress tests against database services (MySQL, PostgreSQL, MongoDB, Redis) with configurable RPS targets, read/write ratios, and replication lag monitoring.

## When to Use
- Benchmarking database query performance under load
- Finding maximum sustainable RPS before failure
- Testing replication lag under write-heavy workloads
- Validating database infrastructure scaling

## Prerequisites
- k6 binary with xk6-sql extension in project root
- Target database accessible and configured
- Products table schema loaded (see `products_schema.sql`)
- Environment variables set or defaults acceptable

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| DB_HOST | 125.212.223.236 | Database host address |
| DB_PORT | varies | Database port (3306/5432/27017/6379) |
| DB_NAME | stresstest | Database name |
| DB_USER | dbadmin | Database user |
| DB_PASSWORD | Devops@2026 | Database password |
| TARGET_RPS | 10000 | Target requests per second |
| RAMP_DURATION | 60s | Ramp-up duration |
| HOLD_DURATION | 5m | Hold duration at target RPS |
| WRITE_RATIO | 1.0 | Write query ratio (0.0-1.0) |
| PRE_ALLOCATED_VUS | 400 | Pre-allocated virtual users |
| MAX_VUS | 1600 | Maximum virtual users |

## Available Test Scripts

| Script | Database | Topology |
|--------|----------|----------|
| k6_mysql_rps.js | MySQL | Single instance |
| k6_mysql_rps_rep.js | MySQL | Primary-replica |
| k6_mysql_rps_cluster.js | MySQL | Cluster |
| k6_mysql_rps_cluster_lb.js | MySQL | Cluster + Load Balancer |
| k6_postgres_rps.js | PostgreSQL | Single instance |
| k6_postgres_rps_rep.js | PostgreSQL | Primary-replica |
| k6_postgres_rps_cluster.js | PostgreSQL | Cluster |
| k6_postgres_rps_cluster_lb.js | PostgreSQL | Cluster + Load Balancer |
| k6_mongodb_rps.js | MongoDB | Single instance |
| k6_mongodb_rps_rep.js | MongoDB | Replica set |
| k6_redis_rps.js | Redis | Single instance |
| k6_redis_rps_rep.js | Redis | Primary-replica |

## Usage

### Basic Run
```bash
TARGET_RPS=5000 HOLD_DURATION=2m ./k6 run k6_mysql_rps.js
```

### High Load Test
```bash
TARGET_RPS=20000 RAMP_DURATION=120s HOLD_DURATION=10m PRE_ALLOCATED_VUS=800 MAX_VUS=3200 ./k6 run k6_postgres_rps.js
```

### Read-Heavy Workload
```bash
WRITE_RATIO=0.2 TARGET_RPS=10000 ./k6 run k6_mysql_rps.js
```

### Write-Heavy Workload
```bash
WRITE_RATIO=0.8 TARGET_RPS=5000 ./k6 run k6_postgres_rps_rep.js
```

### Test Against Remote Host
```bash
DB_HOST=10.0.0.50 DB_PORT=5432 TARGET_RPS=15000 ./k6 run k6_postgres_rps.js
```

## Metrics Tracked

| Metric | Type | Description |
|--------|------|-------------|
| db_query_duration_ms | Trend | Query latency distribution |
| db_query_fail_rate | Rate | Percentage of failed queries |
| db_queries_success_total | Counter | Total successful queries |
| db_queries_total | Counter | Total queries attempted |

## Thresholds

| Metric | Threshold | Action |
|--------|-----------|--------|
| db_query_fail_rate | rate < 0.01 | Abort after ramp |
| db_query_duration_ms | p(95) < 3000ms | Abort after ramp |
| db_query_duration_ms | avg < 3000ms | Warning only |

## Output
- Summary printed to stdout
- JSON results saved to `summary_<db>_<test>.json`
- Replication lag tracked for replica/cluster tests

## Troubleshooting

### Connection Refused
- Verify DB_HOST and DB_PORT
- Check firewall/security groups
- Confirm database is running

### High VU Count Errors
- Increase PRE_ALLOCATED_VUS
- Check system ulimit for open files
- Monitor k6 machine CPU usage

### Threshold Abort
- Check p95 latency in output
- Reduce TARGET_RPS
- Verify database resources (CPU, memory, connections)
