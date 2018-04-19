# ubuntu
FROM ubuntu:16.04
MAINTAINER Tyler Fowle
WORKDIR /usr/local/src
EXPOSE 3000

# Better terminal support
ENV TERM screen-256color
ENV DEBIAN_FRONTEND noninteractive

# Locales
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8

RUN apt-get update && apt-get upgrade -y

# Common packages
RUN apt-get update && apt-get install -y \
      bash \
      build-essential \
      curl \
      libssl-dev \
      libnotify-bin \
      npm \
      ruby-dev \
      rubygems \
      software-properties-common \
      vim \
      xclip \
      zsh

# Change shell to zsh
RUN chsh -s /usr/bin/zsh

# Install nodejs
RUN curl -sL -o /tmp/setup_8.x https://deb.nodesource.com/setup_8.x
RUN bash /tmp/setup_8.x

RUN apt-get install -y nodejs

# npm installs
RUN npm install -g gulp sass sass-convert
RUN gem install sass

# copy configs over from local
ADD package.json /usr/local/src
RUN npm install

# Command for the image
CMD gulp

