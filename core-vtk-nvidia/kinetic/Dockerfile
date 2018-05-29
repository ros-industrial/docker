# rosindustrial/core-vtk-nvidia:kinetic-1.8-8.0

FROM rosindustrial/core-nvidia:kinetic-8.0
LABEL maintainer "Austin.Deric@SwRI.org"

RUN git clone https://github.com/Kitware/VTK.git
WORKDIR /VTK
RUN git checkout tags/v7.1.0
RUN mkdir /vtk_build
WORKDIR /vtk_build
RUN cmake -DCMAKE_BUILD_TYPE=MinSizeRel /VTK
RUN make
RUN make install
RUN rm -rf /VTK /vtk_build

