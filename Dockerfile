From ubuntu:18.04

LABEL maintainer="email.sumandey@gmail.com"

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

# update pip 
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

