# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装必要的依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    cmake \
    pkg-config \
    qtbase5-dev \
    qtchooser \
    qt5-qmake \
    qtbase5-dev-tools \
    libfontconfig1-dev \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libssl-dev \
    wget \
    xz-utils \
    bzip2 \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /wkhtmltopdf

# 克隆源码
RUN git clone --branch 0.12.6 --single-branch https://github.com/wkhtmltopdf/wkhtmltopdf.git .

# 构建静态链接的 wkhtmltopdf
RUN cmake -DSTATIC=ON -DBUILD_SHARED_LIBS=OFF . && make && make install

# 设置默认命令
CMD ["wkhtmltopdf", "--version"]
