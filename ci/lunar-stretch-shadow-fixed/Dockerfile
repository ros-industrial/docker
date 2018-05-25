# DO NOT EDIT!
# This file  was auto-generated with ./sync.sh at Mon May 21 20:51:08 CEST 2018

FROM debian:stretch
LABEL MAINTAINER "Mathias Lüdtke" <mathias.luedtke@ipa.fraunhofer.de>

ENV ROS_DISTRO lunar

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update -qq     && apt-get -qq install --no-install-recommends -y apt-utils gnupg wget ca-certificates lsb-release

RUN echo "deb http://packages.ros.org/ros-shadow-fixed/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver "hkp://ha.pool.sks-keyservers.net" --recv-key "0xB01FA116"     || { wget "https://raw.githubusercontent.com/ros/rosdistro/master/ros.key" -O - | apt-key add -; }

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list     && apt-get update -qq     && apt-get -qq install --no-install-recommends -y         build-essential         python-catkin-tools         python-pip         python-rosdep         python-wstool         ros-lunar-catkin         ssh-client     && apt-get clean     && rm -rf /var/lib/apt/lists/*
