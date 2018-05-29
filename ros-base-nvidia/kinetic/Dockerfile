# nvidia-docker build -t rosindustrial/ros-base-nvidia:kinetic .
FROM rosindustrial/ros-core-nvidia:kinetic
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y \
    ros-kinetic-ros-base \
&& rm -rf /var/lib/apt/lists/*
