# nvidia-docker build -t rosindustrial/ros-desktop-full:kinetic-nvidia9.2 .
FROM nvidia/cuda:9.2-devel-ubuntu16.04
LABEL maintainer "Austin.Deric@gmail.org"

# Setup your sources.list
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Installation

RUN apt-get update && apt-get install -y \
    ros-kinetic-desktop-full \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init
RUN rosdep update


RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

RUN apt-get update && apt-get install -y \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

