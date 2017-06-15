# nvidia-docker build -t rosindustrial/ros-robot-nvidia:lunar .
FROM rosindustrial/ros-base-nvidia:lunar
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y \
    ros-lunar-robot=1.3.1-0* \
&& rm -rf /var/lib/apt/lists/*
