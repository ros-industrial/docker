ARG ROSDISTRO=melodic

FROM ros:$ROSDISTRO-perception
MAINTAINER Levi Armstrong

ARG ROSDISTRO
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-$ROSDISTRO-ompl \
    python-catkin-tools \
    ros-$ROSDISTRO-octomap-msgs \
    ros-$ROSDISTRO-octomap \
    libassimp-dev \
    libtinyxml-dev

RUN git clone --branch master https://github.com/bulletphysics/bullet3.git
RUN mkdir /bullet3_build && \
    cd /bullet3_build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w -std=c++14" -DCMAKE_C_FLAGS="-w" -DBUILD_UNIT_TESTS=OFF -DBUILD_SHARED_LIBS=ON -DBULLET2_MULTITHREADING=OFF -DUSE_DOUBLE_PRECISION=ON ../bullet3 && \
    make -j8 && \
    make install

RUN git clone --branch master https://github.com/danfis/libccd.git
RUN mkdir /libccd_build && \
    cd /libccd_build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w -std=c++14" -DCMAKE_C_FLAGS="-w" -DENABLE_DOUBLE_PRECISION=ON ../libccd && \
    make -j8 && \
    make install

ENV PKG_CONFIG_PATH /opt/ros/$ROSDISTRO/lib/pkgconfig
ENV LD_LIBRARY_PATH /opt/ros/$ROSDISTRO/lib
RUN git clone --branch master https://github.com/flexible-collision-library/fcl.git
RUN mkdir /fcl_build && \
    cd /fcl_build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w -std=c++14" -DBUILD_TESTING=OFF ../fcl && \
    make -j8 && \
    make install

RUN apt-get install --no-install-recommends -y tar wget

RUN wget http://prdownloads.sourceforge.net/swig/swig-4.0.1.tar.gz
RUN tar -xvf swig-4.0.1.tar.gz
RUN cd /swig-4.0.1 && \
    ./configure && \
    make -j8 && \
    make install

RUN git clone --branch release-1.8.1 https://github.com/google/googletest.git
RUN mkdir /gtest_build && \
    cd /gtest_build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-w -std=c++14" -DBUILD_GMOCK=OFF -DBUILD_GTEST=ON -DBUILD_SHARED_LIBS=ON ../googletest && \
    make -j8 && \
    make install

RUN rm -rf /bullet3 /libccd /fcl /bullet3_build /libccd_build /fcl_build /swig-4.0.1 /googletest /gtest_build
RUN rm swig-4.0.1.tar.gz

RUN apt-get install --no-install-recommends -y ros-$ROSDISTRO-rviz ros-$ROSDISTRO-octomap-ros clang clang-tidy libomp-dev lcov
RUN ln -s /usr/local/bin/swig /usr/local/bin/swig4.0
RUN ln -s /usr/local/bin/ccache-swig /usr/local/bin/ccache-swig4.0

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
