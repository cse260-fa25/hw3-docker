FROM ubuntu:24.04

# Basic setup
RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    cmake \
    git \
    sudo

# HW3 Dependencies
RUN apt-get update && apt-get install -y \
    libopenmpi-dev \
    libnetcdf-dev \
    ncview

# ncview font error fix
# https://forum.endeavouros.com/t/ncview-missing-fonts-in-wayland/63258/5
RUN echo "Ncview*font: fixed" >> ~/.Xresources

# Create a non-root user
RUN echo 'ubuntu:ubuntu' | chpasswd \
    && usermod -aG sudo ubuntu
USER ubuntu

# Set working directory
WORKDIR /home/ubuntu/hw3