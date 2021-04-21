ARG DISTRO_VERSION=8
FROM centos:${DISTRO_VERSION}

SHELL ["/bin/bash", "-l", "-c"]

ARG NODE_VERSION=12
RUN set -o pipefail && \
  curl -sL https://rpm.nodesource.com/setup_${NODE_VERSION}.x | bash -

ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true

RUN dnf update -q -y && \
  dnf install -q -y epel-release && \
  dnf -q -y install \
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
  dnf clean all

ENV CYPRESS_CACHE_FOLDER=/tmp/.cache
RUN npm install --quiet -g cypress@^5.4 >> /dev/null && \
  rm -rf /tmp/.cache
