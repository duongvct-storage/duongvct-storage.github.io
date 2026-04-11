#!/usr/bin/env python3
"""
Analyze k6 benchmark summary JSON files and generate comparison reports.
Usage: python3 analyze_benchmarks.py [summary_files...]
"""

import json
import sys
import os
from datetime import datetime


def extract_metrics(filepath):
    """Extract key metrics from a k6 summary JSON file."""
    with open(filepath, "r") as f:
        data = json.load(f)

    metrics = data.get("metrics", {})
    state = data.get("state", {})

    # Determine database type from filename
    basename = os.path.basename(filepath)
    db_type = "unknown"
    topology = "single"

    if "mysql" in basename:
        db_type = "MySQL"
    elif "postgres" in basename:
        db_type = "PostgreSQL"
    elif "mongodb" in basename:
        db_type = "MongoDB"
    elif "redis" in basename:
        db_type = "Redis"

    if "cluster_lb" in basename:
        topology = "cluster+lb"
    elif "cluster" in basename:
        topology = "cluster"
    elif "rep" in basename:
        topology = "replica"

    # Extract metrics with fallbacks
    def get_metric(name, key="avg"):
        m = metrics.get(name, {})
        values = m.get("values", {})
        return values.get(key, 0)

    result = {
        "db_type": db_type,
        "topology": topology,
        "file": basename,
        "tps": get_metric("iterations", "rate"),
        "total_queries": get_metric("db_queries_total", "count")
        or get_metric("iterations", "count"),
        "avg_latency": get_metric("db_query_duration_ms", "avg")
        or get_metric("iteration_duration", "avg"),
        "p90_latency": get_metric("db_query_duration_ms", "p(90)")
        or get_metric("iteration_duration", "p(90)"),
        "p95_latency": get_metric("db_query_duration_ms", "p(95)")
        or get_metric("iteration_duration", "p(95)"),
        "max_latency": get_metric("db_query_duration_ms", "max")
        or get_metric("iteration_duration", "max"),
        "fail_rate": get_metric("db_query_fail_rate", "rate"),
        "vus_max": get_metric("vus_max", "max"),
        "duration_ms": state.get("testRunDurationMs", 0),
    }

    # Replica-specific metrics
    if topology == "replica":
        result["master_tps"] = get_metric("master_queries_total", "rate")
        result["replica_tps"] = get_metric("replica_queries_total", "rate")
        result["master_avg_latency"] = get_metric("master_query_duration_ms", "avg")
        result["replica_avg_latency"] = get_metric("replica_query_duration_ms", "avg")
        result["master_p95_latency"] = get_metric("master_query_duration_ms", "p(95)")
        result["replica_p95_latency"] = get_metric("replica_query_duration_ms", "p(95)")

    return result


def print_comparison_table(results):
    """Print a comparison table of all benchmark results."""
    print("\n" + "=" * 100)
    print("DATABASE BENCHMARK COMPARISON")
    print("=" * 100)
    print(
        f"{'Database':<12} {'Topology':<12} {'TPS':>10} {'Avg(ms)':>10} {'P90(ms)':>10} {'P95(ms)':>10} {'Max(ms)':>10} {'Fail%':>8} {'VUs':>6}"
    )
    print("-" * 100)

    for r in sorted(results, key=lambda x: -x["tps"]):
        print(
            f"{r['db_type']:<12} {r['topology']:<12} {r['tps']:>10.0f} {r['avg_latency']:>10.2f} {r['p90_latency']:>10.2f} {r['p95_latency']:>10.2f} {r['max_latency']:>10.2f} {r['fail_rate'] * 100:>7.2f}% {r['vus_max']:>6.0f}"
        )

    print("=" * 100)


def print_replica_analysis(results):
    """Print detailed replica analysis."""
    replica_results = [r for r in results if r["topology"] == "replica"]

    if not replica_results:
        return

    print("\n" + "=" * 100)
    print("REPLICA TOPOLOGY ANALYSIS")
    print("=" * 100)

    for r in replica_results:
        print(f"\n{r['db_type']} - Primary-Replica:")
        print(f"  Master TPS:  {r.get('master_tps', 0):>10.0f}")
        print(f"  Replica TPS: {r.get('replica_tps', 0):>10.0f}")
        print(f"  Master Avg:  {r.get('master_avg_latency', 0):>10.2f} ms")
        print(f"  Replica Avg: {r.get('replica_avg_latency', 0):>10.2f} ms")
        print(f"  Master P95:  {r.get('master_p95_latency', 0):>10.2f} ms")
        print(f"  Replica P95: {r.get('replica_p95_latency', 0):>10.2f} ms")


def print_findings(results):
    """Print key findings and recommendations."""
    print("\n" + "=" * 100)
    print("KEY FINDINGS")
    print("=" * 100)

    if not results:
        print("No results to analyze.")
        return

    # Best performer
    best = max(results, key=lambda x: x["tps"])
    print(
        f"\n1. Highest TPS: {best['db_type']} ({best['topology']}) with {best['tps']:.0f} TPS"
    )

    # Lowest latency
    lowest_lat = min(
        results,
        key=lambda x: x["p95_latency"] if x["p95_latency"] > 0 else float("inf"),
    )
    print(
        f"2. Lowest P95 Latency: {lowest_lat['db_type']} ({lowest_lat['topology']}) with {lowest_lat['p95_latency']:.2f} ms"
    )

    # Check for issues
    issues = []
    for r in results:
        if r["fail_rate"] > 0.01:
            issues.append(
                f"  - {r['db_type']} ({r['topology']}): High fail rate ({r['fail_rate'] * 100:.2f}%)"
            )
        if r["p95_latency"] > 1000:
            issues.append(
                f"  - {r['db_type']} ({r['topology']}): High P95 latency ({r['p95_latency']:.2f} ms)"
            )

    if issues:
        print(f"\n3. Issues Found:")
        for issue in issues:
            print(issue)
    else:
        print(f"\n3. No critical issues found - all tests within thresholds")


def main():
    if len(sys.argv) < 2:
        # Auto-discover summary files
        summary_files = [
            f
            for f in os.listdir(".")
            if f.startswith("summary_") and f.endswith(".json")
        ]
        if not summary_files:
            print(
                "No summary files found. Usage: python3 analyze_benchmarks.py <file1.json> [file2.json...]"
            )
            sys.exit(1)
    else:
        summary_files = sys.argv[1:]

    results = []
    for filepath in summary_files:
        if not os.path.exists(filepath):
            print(f"Warning: {filepath} not found, skipping")
            continue
        try:
            result = extract_metrics(filepath)
            results.append(result)
            print(f"Loaded: {filepath}")
        except Exception as e:
            print(f"Error processing {filepath}: {e}")

    if results:
        print_comparison_table(results)
        print_replica_analysis(results)
        print_findings(results)
    else:
        print("No valid results to analyze.")


if __name__ == "__main__":
    main()
