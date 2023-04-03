FROM docker.io/ros:noetic

ARG USERNAME=rosuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update -y \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install generic tools for linux
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install git -y
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y iproute2
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y curl wget
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip

# Install ROS Tools
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y ros-$(rosversion -d)-turtlesim
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y ros-$(rosversion -d)-rqt ros-$(rosversion -d)-rqt-common-plugins
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y ros-$(rosversion -d)-gazebo-ros-pkgs ros-$(rosversion -d)-gazebo-ros-control
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y ros-$(rosversion -d)-rviz
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y ros-$(rosversion -d)-rosserial
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y ros-$(rosversion -d)-rosserial-arduino

# Install Audio Dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    alsa-base \
    alsa-utils \
    libsndfile1-dev

# Install Arduino IDE
# RUN wget https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz
# RUN ./arduino-1.8.19/install.sh

# Install Python Extra Tools
RUN /bin/python3 -m pip install -U autopep8

# Install Specific ROS Tools
RUN . /opt/ros/$ROS_DISTRO/setup.sh && rosdep update && \
    apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y ros-noetic-catkin python3-catkin-tools python3-osrf-pycommon
RUN . /opt/ros/$ROS_DISTRO/setup.sh && rosdep update && \
    apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y python3-wstool

# Add MoveIt Setup Script
ADD ./moveit.sh /
RUN ln -s /moveit.sh /bin/setup_moveit
RUN chown $USERNAME:$USERNAME /moveit.sh /bin/setup_moveit
RUN chmod ug+x /moveit.sh /bin/setup_moveit

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
USER rosuser
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
