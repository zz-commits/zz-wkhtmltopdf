FROM ubuntu:22.04

ARG ARCH=x86_64
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      build-essential git python3 python3-pip \
      qtbase5-dev qtchooser \
      libx11-dev libxext-dev libxrender-dev libfontconfig1-dev \
      cmake pkg-config wget xz-utils bzip2 sudo && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /wkhtmltopdf-master
COPY . /wkhtmltopdf-master
