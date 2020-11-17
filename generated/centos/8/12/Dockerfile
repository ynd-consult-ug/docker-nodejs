FROM centos:8

SHELL [ "/bin/bash", "-l", "-c"]

RUN set -o pipefail && \
  curl -sL https://rpm.nodesource.com/setup_12.x | bash -

RUN yum install -q -y epel-release && \
  yum -q -y install \
  autoconf \
  automake \
  bash \
  ca-certificates \
  curl \
  bc \
  gcc-c++ \
  git \
  jq \
  libglvnd-glx \
  file \
  make \
  nodejs \
  postgresql \
  which && \
  useradd -d /node -m -u 1000 node && \
  mkdir -p /app && \
  chown 1000:1000 /app && \
  yum clean all

USER 1000
