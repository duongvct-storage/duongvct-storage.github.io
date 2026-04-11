#!/bin/bash
# run_full_benchmark.sh - Full database benchmark suite orchestrator
# Usage: ./run_full_benchmark.sh [TARGET_RPS] [RAMP_DURATION] [HOLD_DURATION] [WRITE_RATIO]

TARGET_RPS=${1:-10000}
RAMP_DURATION=${2:-60s}
HOLD_DURATION=${3:-5m}
WRITE_RATIO=${4:-0.5}

echo "========================================="
echo "FULL DATABASE BENCHMARK SUITE"
echo "========================================="
echo "Target RPS: $TARGET_RPS"
echo "Ramp Duration: $RAMP_DURATION"
echo "Hold Duration: $HOLD_DURATION"
echo "Write Ratio: $WRITE_RATIO"
echo "========================================="

run_test() {
  local script=$1
  local label=$2
  
  echo -e "\n>>> Testing ${label}..."
  TARGET_RPS=$TARGET_RPS \
  RAMP_DURATION=$RAMP_DURATION \
  HOLD_DURATION=$HOLD_DURATION \
  WRITE_RATIO=$WRITE_RATIO \
    ./k6 run "$script"
  
  local exit_code=$?
  if [ $exit_code -ne 0 ]; then
    echo "WARNING: ${label} test exited with code ${exit_code}"
  fi
  
  sleep 10
}

# Phase 1: Single Instance Tests
echo -e "\n[Phase 1] Single Instance Tests"
for db in mysql postgres mongodb redis; do
  run_test "k6_${db}_rps.js" "${db} single instance"
done

# Phase 2: Replica Tests
echo -e "\n[Phase 2] Primary-Replica Tests"
for db in mysql postgres mongodb redis; do
  run_test "k6_${db}_rps_rep.js" "${db} replica"
done

# Phase 3: Cluster Tests
echo -e "\n[Phase 3] Cluster Tests"
for db in mysql postgres; do
  run_test "k6_${db}_rps_cluster.js" "${db} cluster"
  run_test "k6_${db}_rps_cluster_lb.js" "${db} cluster + LB"
done

echo -e "\n========================================="
echo "BENCHMARK SUITE COMPLETE"
echo "========================================="
echo "Results saved to summary_*.json files"
echo "Run analysis: python3 analyze_benchmarks.py summary_*.json"
