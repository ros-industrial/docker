# rosindustrial/core-nvidia:indigo-8.0
FROM rosindustrial/ros-robot-nvidia:indigo-8.0
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-indigo-industrial-core \
    python-wstool \
    python-catkin-tools \
    liblapack-dev \
    libblas-dev \
    sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
