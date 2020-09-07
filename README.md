# docker-nodejs

This repository provides Dockerfiles for CentOS based images with Nodejs. Dockerfiles are generated with pre-commit git hook (`./git-hooks/pre-commit`) and corresponding template in the project's root, so one needs to run `git config core.hooksPath git-hooks` first in order to use it.

Templates are using nodesource as binary provider for centos [Nodesource](https://nodesource.com/).
