ARG ROSDISTRO=noetic
ARG ROS_BASE_TAG=noetic

FROM ros:$ROS_BASE_TAG
MAINTAINER Levi Armstrong

ARG ROSDISTRO
ARG DEBIAN_FRONTEND=noninteractive
ARG TESSERACT_ROS_VERSION=master

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git \
    python3-colcon-common-extensions \
    python3-vcstool \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN mkdir -p /tesseract/src \
  && cd /tesseract/src \
  && git clone --depth 1 --branch $TESSERACT_ROS_VERSION \
       https://github.com/ros-industrial-consortium/tesseract_ros.git \
  && vcs import --shallow --input tesseract_ros/dependencies.rosinstall . \
  && apt-get update \
  && rosdep install --rosdistro $ROSDISTRO -y --ignore-src --from-paths . \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && cd / \
  && . /opt/ros/$ROSDISTRO/setup.sh \
  && colcon build \
  --base-paths /tesseract/src \
  --build-base /tesseract/build \
  --install-base /opt/tesseract \
  --merge-install \
  --event-handlers status- console_cohesion+ \
  --cmake-args -DCMAKE_BUILD_TYPE=Release \
  && rm -rf /tesseract
