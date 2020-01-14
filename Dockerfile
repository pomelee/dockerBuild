
FROM docker-registry.default.svc:5000/ros2-proj/lg-base-docker:latest

ARG USER=ubuntu
USER ${USER}
WORKDIR /home/$user

