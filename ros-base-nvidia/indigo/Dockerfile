# rosindustrial/ros-base-nvidia:indigo-8.0
FROM rosindustrial/ros-core-nvidia:indigo-8.0
LABEL maintainer "Austin.Deric@SwRI.org"

RUN apt-get update && apt-get install -y \
    ros-indigo-ros-base=1.1.5-0* \
&& rm -rf /var/lib/apt/lists/*
