FROM ubuntu:latest

# Install Cartographer dependencies
RUN apt-get update && apt-get install -q -y \
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
RUN apt-get update && apt-get install -q -y \
	ros-dashing-gazebo-* \
    ros-dashing-cartographer \
    ros-dashing-cartographer-ros \
    ros-dashing-navigation2 \
    ros-dashing-nav2-bringup \
    python3-vcstool \
    wget \
    && rm -rf /var/lib/apt/lists/*


