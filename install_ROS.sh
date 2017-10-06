#!/bin/bash

version=`lsb_release -sc`

echo "[Checking the ubuntu version]"
case $version in
  "trusty" | "xenial")
  ;;
  *)
    echo "ERROR: This script will only work on Trusty(14.04) / Xenial (16.04)."
    exit 0
esac

ROS_DISTRO=$1

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-${ROS_DISTRO}-desktop-full -y
sudo rosdep init
rosdep update
echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo "source /opt/ros/${ROS_DISTRO}/setup.zsh" >> ~/.zshrc
source ~/.zshrc
sudo apt-get install python-rosinstall -y
