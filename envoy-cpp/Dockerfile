FROM ubuntu:latest

# Configure tzdata and timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y && \
  apt install -y git

# Cloning envoy filter example
RUN git clone https://github.com/envoyproxy/envoy-filter-example.git && \
  cd envoy-filter-example && git submodule update --init

# Setting up Bazel and is dependencies
RUN apt install -y curl gnupg && \
  curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg && \
  mv bazel.gpg /etc/apt/trusted.gpg.d/ && \
  echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
  apt update && apt install -y bazel-3.4.1 && apt full-upgrade && \
  alias bazel="bazel-3.4.1" && \
  apt install -y python3 python3-pip cmake ninja-build && \
  alias Ninja="ninja" && \
  ln -s $(which python3) /usr/bin/python

RUN bazel build //:envoy