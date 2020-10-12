ARG ROSDISTRO=melodic

FROM ros:$ROSDISTRO-robot
MAINTAINER Levi Armstrong

ARG ROSDISTRO
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    liblapack-dev \
    libblas-dev \
    libgl1-mesa-dev \
    libxt-dev \
    libflann-dev \
    libqhull-dev \
    git-all \
    tar \
    wget \
    sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN if [ "$ROSDISTRO" != "kinetic" ] && [ "$ROSDISTRO" != "melodic" ] ; then \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    libpcl-dev \
    sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* ; fi

WORKDIR /vtk_build
RUN if [ "$ROSDISTRO" = "kinetic" ] || [ "$ROSDISTRO" = "melodic" ] ; then git clone --branch v8.2.0 https://github.com/Kitware/VTK.git ; fi
RUN if [ "$ROSDISTRO" = "kinetic" ] || [ "$ROSDISTRO" = "melodic" ] ; then cmake -DCMAKE_BUILD_TYPE=Release /vtk_build/VTK && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /vtk_build ; fi

WORKDIR /pcl_build
RUN if [ "$ROSDISTRO" = "kinetic" ] || [ "$ROSDISTRO" = "melodic" ] ; then git clone --branch pcl-1.9.1 https://github.com/PointCloudLibrary/pcl.git ; fi
RUN if [ "$ROSDISTRO" = "kinetic" ] || [ "$ROSDISTRO" = "melodic" ] ; then cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_surface_on_nurbs:BOOL=ON /pcl_build/pcl && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /pcl_build ; fi

CMD ["bash"]
