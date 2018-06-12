#!/usr/bin/env bash

BAG_PATH=~/V1_01_easy.bag
if [ $# -gt 0 ]; then 
	BAG_PATH=$1
fi

gnome-terminal -e 'roscore'

sleep 5

export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:$(pwd)/ORB_SLAM2_PATCH/Examples/ROS

gnome-terminal -e 'rosrun ORB_SLAM2 Stereo ORB_SLAM2_PATCH/Vocabulary/ORBvoc.txt ORB_SLAM2_PATCH/Examples/Stereo/EuRoC.yaml true'

sleep 10

gnome-terminal -e "rosbag play $BAG_PATH /cam0/image_raw:=/camera/left/image_raw /cam1/image_raw:=/camera/right/image_raw"

