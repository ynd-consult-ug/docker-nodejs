FROM centos:8

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -

RUN yum install -q -y epel-release && \
  yum -q -y install \
  bash \
  ca-certificates \
  curl \
  bc \
  gcc-c++ \
  git \
  jq \
  file \
  make \
  nodejs \
  postgresql \
  which && \
  useradd -d /node -m -u 998 node

USER 998