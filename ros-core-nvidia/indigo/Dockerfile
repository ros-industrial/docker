# nvidia-docker build -t rosindustrial/ros-core-nvidia:indigo .
FROM nvidia/cuda:8.0-devel-ubuntu14.04
LABEL maintainer "Austin.Deric@SwRI.org"

ENV ROS_DISTRO indigo

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update -qq     && apt-get -qq install --no-install-recommends -y apt-utils gnupg wget ca-certificates lsb-release dirmngr

RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
RUN for i in 1 2 3; do { apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key 'C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654'; } &&  break || sleep 1; done

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list     && apt-get update -qq     && apt-get -qq install --no-install-recommends -y         build-essential         python-catkin-tools         python-pip         python-rosdep         python-wstool         ros-indigo-catkin         ssh-client     && apt-get clean     && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-indigo-ros-core \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
