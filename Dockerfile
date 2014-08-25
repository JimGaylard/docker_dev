FROM ubuntu:trusty
MAINTAINER Jim Gaylard

ADD ruby-2.1.2.tar.gz /tmp/

WORKDIR /tmp

RUN ['tar', '-xvfz', 'ruby-2.1.2.tar.gz']
RUN ['cd', 'ruby-2.1.2']
RUN ['./configure']
RUN ['make']
RUN ['make install']

WORKDIR /

RUN ['rm', '-r', '/tmp/ruby-2.1.2*']

RUN ['gem', 'install', 'bundler', 'pry', '--no-rdoc', '--no-ri']
