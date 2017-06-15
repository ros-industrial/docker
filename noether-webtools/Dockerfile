# rosindustrial/noether-webtools:kinetic
FROM rosindustrial/noether:kinetic
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-kinetic-rosbridge-suite \
  ros-kinetic-tf2-web-republisher && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
