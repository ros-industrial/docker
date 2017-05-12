# rosindustrial/core:indigo
FROM ros:indigo-robot
LABEL maintainer "Austin.Deric@gmail.com"
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-indigo-industrial-core \
    python-wstool \
    python-catkin-tools \
    liblapack-dev \
    libblas-dev \
    sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
