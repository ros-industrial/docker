# rosindustrial/yak:kinetic
FROM rosindustrial/noether-nvidia:kinetic
LABEL maintainer "Austin.Deric@swri.org"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-perception \
    libopenvdb-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
