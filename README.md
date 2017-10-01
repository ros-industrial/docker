# docker
ROS-Industrial container tools.

To pull images, you need to either specify `tag` or pull all tags with `-a` option. Taking `core` repo as an exmaple,

```
docker pull rosindustrial/core:kinetic  (pulling a tag)
docker pull rosindustrial/core -a       (pulling all tags)
```

## [caffe-cpu](https://hub.docker.com/r/rosindustrial/caffe-cpu)
[BVLC's caffe image](https://github.com/BVLC/caffe) built ontop of the rosindustrial/core image.

## [caffe-gpu](https://hub.docker.com/r/rosindustrial/caffe-gpu)
[BVLC's caffe image](https://github.com/BVLC/caffe) built ontop of the rosindustrial/core image. contains both gpu and cpu versions.

## [ci](https://hub.docker.com/r/rosindustrial/ci)
Continuous Integration Dockerfiles for ros-industrial environments

## [core](https://hub.docker.com/r/rosindustrial/core)
core docker is the root container for all others. 

## [webtools](https://hub.docker.com/r/rosindustrial/webtools)
ros-bridge-suite and all packages nessesary to run robotwebtools

## [noether](https://hub.docker.com/r/rosindustrial/noether)
PCL 1.8 built with VTK 7.1.

## [ros-core-nvidia](https://hub.docker.com/r/rosindustrial/ros-core-nvidia)
osrf [ros-core image](https://hub.docker.com/_/ros/) built ontop of Nvidia's [cuda ubuntu image](https://hub.docker.com/r/nvidia/cuda/).

## [ros-base-nvidia](https://hub.docker.com/r/rosindustrial/ros-base-nvidia)
osrf [ros-base image](https://hub.docker.com/_/ros/) built ontop of rosindstrial/ros-core-nvidia.

## [ros-robot-nvidia](https://hub.docker.com/r/rosindustrial/ros-robot-nvidia)
osrf [ros-robot image](https://hub.docker.com/_/ros/) built ontop of rosindstrial/ros-base-nvidia.

## [core-nvidia](https://hub.docker.com/r/rosindustrial/core-nvidia)
rosindustrial/core iamge built ontop of rosindstrial/ros-robot-nvidia.




