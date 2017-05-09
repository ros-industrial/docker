# rosindustrial/core:kinetic
FROM ros:kinetic-robot
MAINTAINER Austin.Deric@gmail.com
RUN apt-get update && apt-get install -y \
    ros-kinetic-industrial-core \
    python-wstool \
    python-pip \
    liblapack-dev \
    libblas-dev \
    sudo
RUN pip install -U catkin_tools
