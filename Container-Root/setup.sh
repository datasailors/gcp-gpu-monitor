#!/bin/sh

# Not needed for CentOS
#if [ -d /etc/apt ]; then
#        [ -n "$http_proxy" ] && echo "Acquire::http::proxy \"${http_proxy}\";" > /etc/apt/apt.conf; \
#        [ -n "$https_proxy" ] && echo "Acquire::https::proxy \"${https_proxy}\";" >> /etc/apt/apt.conf; \
#        [ -f /etc/apt/apt.conf ] && cat /etc/apt/apt.conf
#fi

git clone https://github.com/b0noI/gcp-gpu-utilization-metrics.git
cd gcp-gpu-utilization-metrics
pip install -r ./requirenments.txt
