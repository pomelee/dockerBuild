FROM ubuntu:latest

LABEL io.k8s.description="Base image for Ubuntu based LEMP" \
      io.k8s.display-name="OpenShift LEMP" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder, Nginx, php-fpm, php-7.1"

COPY ./s2i/bin/ /usr/libexec/s2i

UN useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default \
    && mkdir -p ${HOME} \
    && chown -R 1001:0 ${HOME} && chmod -R g+rwX ${HOME}

RUN apt-get update -y && \
    apt-get install -y software-properties-common

