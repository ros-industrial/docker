# nvidia-docker build -t rosindustrial/ros-base-nvidia:indigo .
FROM rosindustrial/ros-core-nvidia:indigo
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y \
    ros-indigo-ros-base \
&& rm -rf /var/lib/apt/lists/*
