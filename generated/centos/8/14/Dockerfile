FROM centos:8

SHELL [ "/bin/bash", "-l", "-c"]

RUN set -o pipefail && \
  curl -sL https://rpm.nodesource.com/setup_14.x | bash -

ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true

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

ENV CYPRESS_CACHE_FOLDER=/tmp/.cache
RUN npm install -g cypress@^5.4

USER 1000
