FROM ubuntu:latest
MAINTAINER Jim Gaylard <jim@jimgaylard.com>

RUN apt-get -y -qq update
RUN apt-get -y -qq install \
    build-essential \
    openssl \
    libreadline6 \
    libreadline6-dev \
    curl \
    libssl-dev \
    libyaml-dev \
    libxml2-dev \
    libxslt-dev \
    autoconf \
    libc6-dev \
    ncurses-dev \
    automake \
    libtool \
    bison \
    nodejs


ADD tmp/ruby-2.1.2.tar.gz /tmp/

WORKDIR /tmp/ruby-2.1.2

RUN ./configure
RUN make
RUN make install

WORKDIR /

RUN rm -r /tmp/ruby-2.1.2

RUN gem install bundler pry --no-rdoc --no-ri
