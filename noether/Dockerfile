ARG ROSDISTRO=melodic

FROM rosindustrial/core:$ROSDISTRO
MAINTAINER Levi Armstrong

ARG ROSDISTRO
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends

WORKDIR /vtk_build
RUN git clone --branch v8.2.0 https://github.com/Kitware/VTK.git
RUN cmake -DCMAKE_BUILD_TYPE=Release /vtk_build/VTK && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /vtk_build

WORKDIR /pcl_build
RUN git clone --branch pcl-1.9.1 https://github.com/PointCloudLibrary/pcl.git
RUN cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_surface_on_nurbs:BOOL=ON /pcl_build/pcl && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf /pcl_build

CMD ["bash"]
