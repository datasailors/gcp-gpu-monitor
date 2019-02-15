#!/bin/sh

# Container startup script

echo ""
echo "Sending GPU Metrics to GCP project ${GOOGLE_CLOUD_PROJECT}"
cd /gcp-gpu-utilization-metrics
if [ "$http_proxy" == "" ]; then unset http_proxy; fi
if [ "$https_proxy" == "" ]; then unset https_proxy; fi
python ./report_gpu_metrics.py

