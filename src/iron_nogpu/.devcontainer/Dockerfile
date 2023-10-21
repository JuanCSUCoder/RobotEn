FROM docker.io/osrf/ros:iron-desktop-full
ARG USERNAME=rosuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
ENV SHELL /bin/bash

# Configure Colcon Mixin
RUN colcon mixin remove default
RUN colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml
RUN colcon mixin update default

# Install MoveIt
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-moveit
RUN apt-get update && apt-get install -y python3-colcon-common-extensions python3-colcon-mixin

# Install Gazebo
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-ros-gz

# Setup CycloneDDS
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-rmw-cyclonedds-cpp

# Install TurtleBot3
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-turtlebot3*

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# Configure User
USER $USERNAME
RUN echo "source /opt/ros/humble/setup.bash" >> /home/rosuser/.bashrc
RUN echo "source /home/rosuser/ws/install/setup.bash || echo 'Workspace not Ready. Run colcon build at /home/rosuser/ws'" >> /home/rosuser/.bashrc
RUN echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> /home/rosuser/.bashrc
RUN echo "export TURTLEBOT3_MODEL=waffle" >> /home/rosuser/.bashrc
RUN echo "export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS_DISTRO/share/turtlebot3_gazebo/models" >> /home/rosuser/.bashrc

CMD ["/bin/bash"]