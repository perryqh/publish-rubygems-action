FROM ruby:3
FROM ubuntu:16.04

# Update default packages
RUN apt-get update

# Get Ubuntu packages
RUN apt-get install -y \
    build-essential \
    curl

# Update new packages
RUN apt-get update

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

LABEL "name"="Publish to Rubygems"
LABEL "version"="3.0.0"

LABEL "com.github.actions.name"="Publish to Rubygems"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="red"
LABEL "com.github.actions.description"="Build and publish your gem to Rubygems"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
