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
    ros-$ROSDISTRO-rviz2; else \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ros-$ROSDISTRO-octomap \
    ros-$ROSDISTRO-rviz && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* ; fi

WORKDIR /bullet3_build
RUN git clone --branch master https://github.com/bulletphysics/bullet3.git
RUN cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DCMAKE_C_FLAGS="-w" \
      -DBUILD_UNIT_TESTS=OFF \
      -DBUILD_SHARED_LIBS=ON \
      -DBULLET2_MULTITHREADING=OFF \
      -DUSE_DOUBLE_PRECISION=ON \
      /bullet3_build/bullet3 && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /bullet3_build

WORKDIR /libccd_build
RUN git clone --branch master https://github.com/danfis/libccd.git
RUN cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DCMAKE_C_FLAGS="-w" \
      -DENABLE_DOUBLE_PRECISION=ON \
      /libccd_build/libccd && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /libccd_build

ENV PKG_CONFIG_PATH /opt/ros/$ROSDISTRO/lib/pkgconfig
ENV LD_LIBRARY_PATH /opt/ros/$ROSDISTRO/lib
WORKDIR /fcl_build
RUN git clone --branch master https://github.com/flexible-collision-library/fcl.git
RUN cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DBUILD_TESTING=OFF \
      /fcl_build/fcl && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /fcl_build

WORKDIR /swig_build
RUN wget http://prdownloads.sourceforge.net/swig/swig-4.0.1.tar.gz
RUN tar -xzvf swig-4.0.1.tar.gz --strip 1
RUN ./configure && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /swig_build && \
    ln -s /usr/local/bin/swig /usr/local/bin/swig4.0 && \
    ln -s /usr/local/bin/ccache-swig /usr/local/bin/ccache-swig4.0

WORKDIR /gtest_build
RUN git clone --branch release-1.8.1 https://github.com/google/googletest.git
RUN cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DBUILD_GMOCK=OFF \
      -DBUILD_GTEST=ON \
      -DBUILD_SHARED_LIBS=ON \
      /gtest_build/googletest && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /gtest_build

WORKDIR /gbenchmark_build
RUN if [ "$ROSDISTRO" = "kinetic" ] ; then git clone --branch v1.5.0 https://github.com/google/benchmark.git ; fi
RUN if [ "$ROSDISTRO" = "kinetic" ] ; then \
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="-w -std=c++14" \
      -DBENCHMARK_ENABLE_GTEST_TESTS=OFF \
      -DBUILD_SHARED_LIBS=ON \
      /gbenchmark_build/benchmark && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /gbenchmark_build ; fi

CMD ["bash"]
