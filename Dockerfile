FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y software-properties-common

CMD /bin/bash

