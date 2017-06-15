# rosindustrial/a5:kinetic
FROM rosindustrial/noether:kinetic
LABEL maintainer "Austin.Deric@swri.org"
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-kinetic-stage && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
