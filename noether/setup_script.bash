#!/bin/bash
git clone https://github.com/Kitware/VTK.git
mkdir /vtk_build
cd /vtk_build
cmake -DCMAKE_BUILD_TYPE=MinSizeRel ../VTK
make
make install
cd ..
mkdir /pcl_build
git clone https://github.com/AustinDeric/pcl.git
cd /pcl
cmake -DCMAKE_BUILD_TYPE=MinSizeRel ../pcl
make
make install
rm -rf /VTK /pcl /pcl_build /vtk_build
