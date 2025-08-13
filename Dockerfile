FROM ubuntu:22.04

ARG ARCH=x86_64
ENV DEBIAN_FRONTEND=noninteractive

# 安装依赖
RUN apt-get update && \
    apt-get install -y \
      build-essential git python3 python3-pip qt5-default \
      libx11-dev libxext-dev libxrender-dev libfontconfig1-dev \
      cmake pkg-config wget xz-utils bzip2 sudo && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /wkhtmltopdf

# 拷贝源代码（GitHub Actions 会挂载源码）
COPY . .

# 构建脚本可在容器内执行 ./build.py --static
