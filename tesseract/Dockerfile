ARG ROSDISTRO=melodic
ARG ROS_BASE_TAG=melodic-perception

FROM ros:$ROS_BASE_TAG
MAINTAINER Levi Armstrong

ARG ROSDISTRO
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    clang \
    clang-tidy \
    lcov \
    libassimp-dev \
    libomp-dev \
    libompl-dev \
    libtinyxml-dev \
    libtinyxml2-dev \
    liboctomap-dev \
    git-all \
    tar \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN if [ "$ROSDISTRO" = "foxy" ] ; then \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ros-$ROSDISTRO-perception-pcl \
    ros-$ROSDISTRO-rviz2 \
    libbullet-dev \
    libbullet-extras-dev && \
    apt-get clean && \
  rm -rf /var/lib/apt/lists/* ; fi

RUN if [ "$ROSDISTRO" = "noetic" ] ; then \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ros-$ROSDISTRO-octomap \
    ros-$ROSDISTRO-rviz \
    ros-$ROSDISTRO-taskflow \
    ros-$ROSDISTRO-fcl \
    libbullet-dev \
    libbullet-extras-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* ; fi

RUN if [ "$ROSDISTRO" = "melodic" ] ; then \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    python-pip \
    ros-$ROSDISTRO-octomap \
    ros-$ROSDISTRO-rviz && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* ; fi

ENV PKG_CONFIG_PATH /opt/ros/$ROSDISTRO/lib/pkgconfig
ENV LD_LIBRARY_PATH /opt/ros/$ROSDISTRO/lib

WORKDIR /multi_distro_build
RUN mkdir swig_build && \
    cd swig_build && \
    wget http://prdownloads.sourceforge.net/swig/swig-4.0.2.tar.gz && \
    tar -xzvf swig-4.0.2.tar.gz --strip 1 && \
    ./configure && \
    make -j8 && \
    make install && \
    ln -s /usr/local/bin/swig /usr/local/bin/swig4.0 && \
    ln -s /usr/local/bin/ccache-swig /usr/local/bin/ccache-swig4.0 && \
    cd .. && \
    mkdir gtest_build && \
    cd gtest_build && \
    git clone --branch release-1.8.1 https://github.com/google/googletest.git && \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DBUILD_GMOCK=OFF \
      -DBUILD_GTEST=ON \
      -DBUILD_SHARED_LIBS=ON \
      /multi_distro_build/gtest_build/googletest && \
    make -j8 && \
    make install && \
    cd .. && \
    cd .. && \
    rm -rf /multi_distro_build

WORKDIR /ext_build
RUN if [ "$ROSDISTRO" = "melodic" ] ; then \
    mkdir bullet_build && \
    cd bullet_build && \
    git clone --branch master https://github.com/bulletphysics/bullet3.git && \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DCMAKE_C_FLAGS="-w" \
      -DBUILD_UNIT_TESTS=OFF \
      -DBUILD_SHARED_LIBS=ON \
      -DBULLET2_MULTITHREADING=OFF \
      -DUSE_DOUBLE_PRECISION=ON \
      /ext_build/bullet_build/bullet3 && \
    make -j8 && \
    make install && \
    cd .. && \
    mkdir ccd_build && \
    cd ccd_build && \
    git clone --branch master https://github.com/danfis/libccd.git && \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DCMAKE_C_FLAGS="-w" \
      -DENABLE_DOUBLE_PRECISION=ON \
      /ext_build/ccd_build/libccd && \
    make -j8 && \
    make install && \
    cd .. && \
    mkdir fcl_build && \
    cd fcl_build && \
    git clone --branch master https://github.com/flexible-collision-library/fcl.git && \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DBUILD_TESTING=OFF \
      /ext_build/fcl_build/fcl && \
    make -j8 && \
    make install && \
    cd .. && \
    mkdir taskflow_build && \
    cd taskflow_build && \
    git clone --branch test/TaskflowVersion3CMake310 https://github.com/Levi-Armstrong/cpp-taskflow.git && \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      /ext_build/taskflow_build/cpp-taskflow && \
    make -j8 && \
    make install && \
    cd .. && \
    cd .. && \
    rm -rf /ext_build ; fi

RUN if [ "$ROSDISTRO" = "foxy" ] ; then \
    mkdir ccd_build && \
    cd ccd_build && \
    git clone --branch master https://github.com/danfis/libccd.git && \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DCMAKE_C_FLAGS="-w" \
      -DENABLE_DOUBLE_PRECISION=ON \
      /ext_build/ccd_build/libccd && \
    make -j8 && \
    make install && \
    cd .. && \
    mkdir fcl_build && \
    cd fcl_build && \
    git clone --branch master https://github.com/flexible-collision-library/fcl.git && \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DBUILD_TESTING=OFF \
      /ext_build/fcl_build/fcl && \
    make -j8 && \
    make install && \
    cd .. && \
    cd .. && \
    rm -rf /ext_build ; fi

RUN git config --global user.email tesseract@ros-industrial.com && git config --global user.name ROS Industrial

CMD ["bash"]
