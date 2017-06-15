# rosindustrial/core-nvidia:kinetic
FROM rosindustrial/ros-robot-nvidia:kinetic
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-industrial-core \
    python-wstool \
    python-catkin-tools \
    liblapack-dev \
    libblas-dev \
    sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
