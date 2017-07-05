# rosindustrial/ros-robot-nvidia:kinetic-8.0
FROM rosindustrial/ros-base-nvidia:kinetic-8.0
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y \
    ros-kinetic-robot=1.3.1-0* \
&& rm -rf /var/lib/apt/lists/*
