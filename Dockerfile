FROM ubuntu:bionic

RUN apt-get update && \
  apt-get install -yqq \
    cmake \
    make \
    git \
    g++ \
    xorg-dev \
    libavahi-compat-libdnssd-dev \
    libcurl3-dev \
    libegl1-mesa \
    libgl1-mesa-glx \
    libsodium-dev \
    libssl-dev \
    libx11-dev \
    qt5-default \
    python

ADD . /usr/src/synergy

WORKDIR /usr/src/synergy
RUN mkdir build && \
  cd build && \
  SYNERGY_REVISION=$(git rev-parse --short HEAD) cmake .. && \
  make
