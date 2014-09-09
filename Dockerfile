FROM ubuntu:latest
MAINTAINER Jim Gaylard <jim@jimgaylard.com>

RUN apt-get update
RUN apt-get install \
    build-essential \
    openssl \
    libreadline6 \
    libreadline6-dev \
    curl \
    git-core \
    zlib1g \
    zlib1g-dev \
    libssl-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libxml2-dev \
    libxslt-dev \
    autoconf \
    libc6-dev \
    ncurses-dev \
    automake \
    libtool \
    bison \
    nodejs \
    subversion


ADD tmp/ruby-2.1.2.tar.gz /tmp/

WORKDIR /tmp/ruby-2.1.2

RUN ./configure
RUN make
RUN make install

WORKDIR /

RUN rm -r /tmp/ruby-2.1.2

RUN gem install bundler pry --no-rdoc --no-ri
