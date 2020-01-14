
FROM docker-registry.default.svc:5000/sample-project1/lg-base:latest

ARG USER=ubuntu
USER ${USER}
WORKDIR /home/$user

RUN for i in x y z; do echo "$i"; done
