FROM ubuntu:latest

# Install the packages contained in `packages.txt`
COPY packages.txt /packages.txt
RUN apt-get update
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y python3
RUN cat /packages.txt | grep -v '^#' | DEBIAN_FRONTEND=noninteractive xargs apt-get install -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm /packages.txt
