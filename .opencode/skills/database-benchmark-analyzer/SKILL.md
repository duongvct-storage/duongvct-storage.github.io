# Database Benchmark Analyzer

## Purpose
Analyze k6 benchmark results from JSON summary files, compare performance across database types and topologies, and generate actionable performance reports.

## When to Use
- After running k6 stress tests to analyze results
- Comparing performance between database engines
- Identifying performance bottlenecks
- Generating benchmark reports for stakeholders

## Input Files
- `summary_mysql_rps.json`
- `summary_postgres_rps.json`
- `summary_mongodb_rps.json`
- `summary_redis_rps.json`
- `summary_*_rps_rep.json` (replica tests)
- `summary_*_rps_cluster*.json` (cluster tests)

## Key Metrics to Extract

### Performance Metrics
| Metric | JSON Path | Description |
|--------|-----------|-------------|
| TPS | `metrics.iterations.values.rate` | Transactions per second |
| Avg Latency | `metrics.db_query_duration_ms.values.avg` | Average query latency |
| P95 Latency | `metrics.db_query_duration_ms.values["p(95)"]` | 95th percentile latency |
| P90 Latency | `metrics.db_query_duration_ms.values["p(90)"]` | 90th percentile latency |
| Max Latency | `metrics.db_query_duration_ms.values.max` | Maximum query latency |
| Fail Rate | `metrics.db_query_fail_rate.values.rate` | Query failure rate |
| Total Queries | `metrics.db_queries_total.values.count` | Total queries executed |
| Test Duration | `state.testRunDurationMs` | Test run duration in ms |

### Replica-Specific Metrics
| Metric | JSON Path | Description |
|--------|-----------|-------------|
| Master TPS | `metrics.master_queries_total.values.rate` | Master node TPS |
| Replica TPS | `metrics.replica_queries_total.values.rate` | Replica node TPS |
| Master Latency | `metrics.master_query_duration_ms.values` | Master query latency |
| Replica Latency | `metrics.replica_query_duration_ms.values` | Replica query latency |
| Replication Lag | Custom metric or max lag tracked | Max replication lag seconds |

## Analysis Workflow

### 1. Extract Summary Data
```bash
# Extract key metrics using jq
cat summary_mysql_rps.json | jq '{
  tps: .metrics.iterations.values.rate,
  avg_latency: .metrics.db_query_duration_ms.values.avg,
  p95_latency: .metrics.db_query_duration_ms.values["p(95)"],
  fail_rate: .metrics.db_query_fail_rate.values.rate,
  duration_ms: .state.testRunDurationMs
}'
```

### 2. Compare Database Engines
Create comparison table:
| Database | TPS | Avg Latency | P95 Latency | Fail Rate | VUs Max |
|----------|-----|-------------|-------------|-----------|---------|
| MySQL | 24986 | 27ms | 38ms | 0% | 800 |
| PostgreSQL | - | - | - | - | - |
| MongoDB | - | - | - | - | - |
| Redis | - | - | - | - | - |

### 3. Compare Topologies
For each database, compare:
- Single instance vs Primary-Replica vs Cluster vs Cluster+LB
- Read/write performance differences
- Replication lag under load

### 4. Identify Bottlenecks
Look for:
- P95 latency > 1000ms (threshold breach)
- Fail rate > 1% (unacceptable)
- High dropped_iterations (VU starvation)
- VUs hitting MAX_VUS limit (need more VUs)
- Replication lag > 1s (replica falling behind)

## Report Template

```markdown
# Database Benchmark Report

## Test Configuration
- Target RPS: {TARGET_RPS}
- Ramp Duration: {RAMP_DURATION}
- Hold Duration: {HOLD_DURATION}
- Write Ratio: {WRITE_RATIO}
- Max VUs: {MAX_VUS}

## Results Summary
| Database | Topology | TPS | Avg (ms) | P95 (ms) | Fail Rate |
|----------|----------|-----|----------|----------|-----------|
| MySQL | Single | | | | |
| MySQL | Replica | | | | |
| PostgreSQL | Single | | | | |
| PostgreSQL | Replica | | | | |

## Key Findings
1. ...
2. ...
3. ...

## Recommendations
1. ...
2. ...
```

## Troubleshooting Analysis

### High Dropped Iterations
- Indicates VU starvation
- Increase PRE_ALLOCATED_VUS and MAX_VUS
- Check k6 machine CPU capacity

### VUs at Max
- VUs reached MAX_VUS limit
- Results may not reflect true capacity
- Increase MAX_VUS and re-run

### High P95 vs Avg
- Tail latency problem
- Check for GC pauses, connection pool exhaustion
- Look at max latency for outliers

### Replication Lag
- Write-heavy workloads cause lag
- Check replica read consistency requirements
- Consider read-from-primary for critical reads
