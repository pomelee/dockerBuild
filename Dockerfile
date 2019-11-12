FROM ubuntu:18.04
FROM ros:dashing-ros-base-bionic

RUN yum -y update

# Install Cartographer dependencies
RUN apt-get update && apt install -q -y \
	google-mock \
    libceres-dev \
    liblua5.3-dev \
    libboost-dev \
    libboost-iostreams-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libcairo2-dev \
    libpcl-dev \
    python3-sphinx \
    net-tools \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Install TurtleBot3 dependencies
RUN curl -sSL http://get.gazebosim.org | sh
RUN apt-get update && apt install -q -y \
	ros-dashing-gazebo-* \
    ros-dashing-cartographer \
    ros-dashing-cartographer-ros \
    ros-dashing-navigation2 \
    ros-dashing-nav2-bringup \
    python3-vcstool \
    wget \
    && rm -rf /var/lib/apt/lists/*


# Install & Merge Test example TurtleBot3 ROS 2 Packages
RUN /bin/bash -c "source /opt/ros/dashing/setup.bash ;\
                  mkdir -p ~/turtlebot3_ws/src ;\
                  cd ~/turtlebot3_ws ;\
                  wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos; \
                  vcs import src < turtlebot3.repos; \
                  colcon build --symlink-install"

# Save Bash Command for Setup
RUN /bin/bash -c "echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc ;\
                  echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc ;\
                  echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc ;\
                  source ~/.bashrc"

# Download demo example
RUN /bin/bash -c "git clone https://github.com/pomelee/test.git ;\
                  cp test/run_teleoperation.sh . ;\
                  chmod +x teleop_keyboard.py ;\
                  cp test/teleop_keyboard.py ~/turtlebot3_ws/src/turtlebot3/turtlebot3/turtlebot3_teleop/turtlebot3_teleop/script/ ;\
                  chmod +x run_teleoperation.sh"
