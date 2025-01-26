FROM ubuntu:latest

# Install the packages contained in `packages.txt`
COPY packages.txt /packages.txt
RUN apt-get update
RUN cat /packages.txt | grep -v '^#' | DEBIAN_FRONTEND=noninteractive xargs apt-get install -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm /packages.txt
