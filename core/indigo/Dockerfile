FROM ros:indigo
MAINTAINER "Austin.Deric@gmail.com"
RUN apt-get -y update
RUN apt-get install -y wget
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
RUN wget http://packages.ros.org/ros.key -O - | apt-key add -
RUN apt-get install -y python-wstool
RUN apt-get install -y python-catkin-tools
RUN apt-get install -y ros-indigo-moveit
RUN apt-get install -y ros-indigo-openni2-camera
RUN apt-get install -y ros-indigo-perception-pcl
RUN apt-get install -y ros-indigo-roslint
RUN apt-get install -y ros-indigo-rqt-gui
RUN apt-get install -y ros-indigo-rqt-gui-cpp
RUN apt-get install -y ros-indigo-rqt-gui-py

