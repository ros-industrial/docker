# rosindustrial/noether-nvidia:kinetic-1.8-8.0
FROM rosindustrial/core-vtk-nvidia:kinetic-7.1-8.0
LABEL maintainer "Austin.Deric@SwRI.org"

RUN git clone https://github.com/PointCloudLibrary/pcl.git
WORKDIR /pcl
RUN git checkout tags/pcl-1.8.0
RUN mkdir /pcl_build
WORKDIR /pcl_build
cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DBUILD_CUDA=ON -DBUILD_GPU=ON -DWITH_ENSENSO=ON /pcl
RUN make
RUN make install
RUN rm -rf /pcl_build /pcl
