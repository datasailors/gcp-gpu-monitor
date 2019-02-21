FROM nvidia/cuda:9.2-runtime-centos7

MAINTAINER Alex Iankoulski <alex_iankoulski@yahoo.com>
# Reference & Credits: Viacheslav Kovalevskyi
# Project: https://github.com/b0noI/gcp-gpu-utilization-metrics
# Fork: https://github.com/iankoulski/gcp-gpu-utilization-metrics
 

ARG http_proxy
ARG https_proxy
ARG no_proxy

ADD Container-Root /

RUN export http_proxy=$http_proxy; export https_proxy=$https_proxy; export no_proxy=$no_proxy; /setup.sh; rm -f /setup.sh

CMD /startup.sh

