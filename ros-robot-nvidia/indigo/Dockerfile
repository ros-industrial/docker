# nvidia-docker build -t rosindustrial/ros-robot-nvidia:indigo .
FROM rosindustrial/ros-base-nvidia:indigo
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y \
    ros-indigo-robot \
&& rm -rf /var/lib/apt/lists/*
