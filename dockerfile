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

# HW3 correctness.sh script dependencies
RUN apt-get update && apt-get install -y \
    python3

# ncview font error fix dependency
# https://forum.endeavouros.com/t/ncview-missing-fonts-in-wayland/63258/5
RUN apt-get update && apt-get install -y x11-xserver-utils

# Clean up apt cache to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN echo 'ubuntu:ubuntu' | chpasswd \
    && usermod -aG sudo ubuntu
USER ubuntu

# ncview font error fix
# https://forum.endeavouros.com/t/ncview-missing-fonts-in-wayland/63258/5
RUN echo "Ncview*font: fixed" >> ~/.Xresources \
    && echo "xrdb ~/.Xresources" >> ~/.bashrc

# Set working directory
WORKDIR /home/ubuntu/hw3