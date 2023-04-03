#!/bin/bash

source /opt/ros/noetic/setup.bash

# Build Workspace
catkin_make
catkin_make install
rosdep update

cd src

# Setup MoveIt Workspace
wstool init .
wstool merge -t . https://raw.githubusercontent.com/ros-planning/moveit/master/moveit.rosinstall
wstool remove  moveit_tutorials  # this is cloned in the next section
wstool update -t .

# Clone Example Repos
git clone https://github.com/ros-planning/moveit_tutorials.git -b master
git clone https://github.com/ros-planning/panda_moveit_config.git -b noetic-devel

# Install Dependencies
rosdep install -y --from-paths . --ignore-src --rosdistro noetic

cd ..

# Build MoveIt
catkin_make

# Configures the Environment
source devel/setup.bash
echo "source $(realpath ./devel/setup.bash)" >> ~/.bashrc

echo "MoveIt Development Environment Configured!"
