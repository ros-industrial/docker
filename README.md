# docker
ROS-Industrial container tools.

[![Build Status](https://travis-ci.org/ros-industrial/docker.svg?branch=master)](https://travis-ci.org/ros-industrial/docker)

## caffe-cpu
[BVLC's caffe image](https://github.com/BVLC/caffe) built ontop of the rosindustrial/core image.

## caffe-gpu
[BVLC's caffe image](https://github.com/BVLC/caffe) built ontop of the rosindustrial/core image. contains both gpu and cpu versions.

## ci
Continuous Integration Dockerfiles for ros-industrial environments

## core
core docker is the root container for all others.

## noether
PCL 1.8 built with VTK 7.1.

## ros-core-nvidia
osrf [ros-core image](https://hub.docker.com/_/ros/) built ontop of Nvidia's [cuda ubuntu image](https://hub.docker.com/r/nvidia/cuda/).

## ros-base-nvidia
osrf [ros-base image](https://hub.docker.com/_/ros/) built ontop of rosindstrial/ros-core-nvidia.

## ros-robot-nvidia
osrf [ros-robot image](https://hub.docker.com/_/ros/) built ontop of rosindstrial/ros-base-nvidia.

## core-nvidia
rosindustrial/core iamge built ontop of rosindstrial/ros-robot-nvidia.




