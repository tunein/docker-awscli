# 809163537096.dkr.ecr.us-west-2.amazonaws.com/circleci/awscli-dind
FROM docker:dind

# This hack is widely applied to avoid python print issues in docker containers
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN set -ex; \
    apk -uv add --no-cache \
        groff \
        jq \
        less \
        make \
        python3 \
        bash \
        git \
    ; \
    python3 -m ensurepip; \
    ln -s python3 /usr/bin/python ;\
    pip3 install --no-cache --upgrade pip setuptools wheel; \
    pip install --no-cache-dir awscli;
