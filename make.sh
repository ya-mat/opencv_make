#!/bin/sh

# before
#sudo apt install gcc
#sudo apt install g++
#sudo apt install gfortran
#sudo apt install wget
#sudo apt install make
#sudo apt install cmake

# install Eigen 3.3.8
# Eigen (and unsupported) is installed to '/usr/local/include'
#wget https://gitlab.com/libeigen/eigen/-/archive/3.3.8/eigen-3.3.8.tar.gz && \
#tar zxvf eigen-3.3.8.tar.gz && \
#cp -r eigen-3.3.8/Eigen ./

# OpenCV-4.5.1
wget https://github.com/opencv/opencv/archive/4.5.1.zip && \
unzip 4.5.1.zip && \
cd opencv-4.5.1/ && \
mkdir build && \
cd build && \
wget https://github.com/opencv/opencv_contrib/archive/4.5.1.zip && \
unzip 4.5.1.zip && \
mkdir build_install && \
cmake -D BUILD_JPEG=ON \
      -D BUILD_PNG=ON \
      -D BUILD_SHARED_LIBS=ON \
      -D BUILD_TIFF=ON \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=./build_install \
      -D OPENCV_EXTRA_MODULES_PATH=./opencv_contrib-4.5.1/modules \
      -D WITH_OPENMP=ON \
      .. && \
make && \
make install && \
cd ../../ && \
cp -r opencv-4.5.1/build/build_install/lib/ ./ && \
mkdir include && \
cp -r opencv-4.5.1/build/build_install/include/opencv4 ./include/
