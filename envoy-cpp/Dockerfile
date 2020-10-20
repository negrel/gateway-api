FROM envoyproxy/envoy-build-ubuntu:b480535e8423b5fd7c102fd30c92f4785519e33a

# Configure tzdata and timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y && \
  apt install -y git

# Cloning envoy filter example
RUN git clone https://github.com/envoyproxy/envoy-filter-example.git && \
  cd envoy-filter-example && git submodule update --init

WORKDIR /envoy-filter-example

RUN bazel build //:envoy