# gcp-gpu-monitor
This is a GPU Utilization Monitoring Container for reporting metrics from VM instances with GPU to Google Cloud StackDriver.
This is a [Depend on Docker](https://github.com/bhgedigital/depend-on-docker) project.

# Usage

1. Run the container on any VM that has NVIDIA GPU available

```
./run.sh
```

or deploy as daemonset on Kubernetes

```
kubectl apply -f ./daemonset-gcp-gpu-monitor.yaml
```

Optional configuration:
* GPU_PRINT_LOGS - When True or Yes (case insensitive) the monitor will print metrics to stdout in addition to sending them to GCP, When False or No (case insensitive, default) the monitor will only send metrics to GCP
* GPU_REPORTING_FREQUENCY - Seconds delay between subsequence metrics reports.
* GPU_METRIC_SUFFIX - String (e.g. cluster name) to be appended to the reported metrics. This is useful when two clusters in the same project are doing reporting. Default is '', meaning use project wide metric names.


2. Test that GPU Utilization reporting works

Run a workload on your GPU or use the gpu_burn utility as follows to generate load.

docker run --rm laboroai/gpu-burn bash -c "gpu-burn/gpu_burn 3600"

3. Configure Dashboard in GCP Console

Go to GCP Console -> Stackdriver -> Monitoring

Click on Resources -> Metrics Explorer

Type "custom/gpu" in the "Find resource type and metric" textbox.

<img src="MetricsExplorer.png" alt="Metrics Explorer screenshot"/>

You will see two metrics available: custom/gpu_memory_utilization and custom/gpu_utilization

Create charts and dashboards and/or use these metrics for auto-scaling as needed.


