#!/usr/bin/env bash

./clear.sh

cd ORB_SLAM2_PATCH
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:$(pwd)/Examples/ROS
./build.sh
./build_ros.sh

# build clusterization
cd ../cluster
cmake .
make 
