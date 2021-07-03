FROM rosindustrial/core:kinetic
LABEL maintainer="Stevie Dale <sdale4@asu.edu>"

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      make cmake build-essential git checkinstall \
      libeigen3-dev \
      libflann-dev \
      libusb-1.0-0-dev \
      libpcap-dev \
      libboost-all-dev \
      libproj-dev \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN \
    git clone --branch v7.1.0 --depth 1 https://github.com/Kitware/VTK.git vtk-trunk && \
    cd vtk-trunk && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j 4 && checkinstall --default --pkgname=vtk-7.1 && \
    make clean && cd /tmp && rm -rf vtk-trunk

RUN \
    git clone --branch pcl-1.8.0 --depth 1 https://github.com/PointCloudLibrary/pcl.git pcl-trunk && \
    cd pcl-trunk && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j 4 && checkinstall --default --pkgname=pcl-1.8.0 && \
    make clean && cd /tmp && rm -rf pcl-trunk

RUN ldconfig
WORKDIR /
