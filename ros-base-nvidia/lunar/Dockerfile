# rosindustrial/ros-base-nvidia:lunar
FROM rosindustrial/ros-core-nvidia:lunar-8.0
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y \
    ros-lunar-ros-base \
&& rm -rf /var/lib/apt/lists/*
