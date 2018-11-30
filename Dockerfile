FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

COPY . /usr/src/osb
COPY docker-entrypoint.sh /

RUN update-alternatives --install /bin/sh sh /bin/bash 100

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git-core 
RUN apt-get -y install curl 
RUN apt-get -y install zlib1g-dev 
RUN apt-get -y install build-essential 
RUN apt-get -y install libssl-dev 
RUN apt-get -y install libreadline-dev 
RUN apt-get -y install libyaml-dev 
RUN apt-get -y install libsqlite3-dev 
RUN apt-get -y install sqlite3 
RUN apt-get -y install libxml2-dev 
RUN apt-get -y install libxslt1-dev 
RUN apt-get -y install libcurl4-openssl-dev 
RUN apt-get -y install python-software-properties 
RUN apt-get -y install libffi-dev 
RUN apt-get -y install libncurses5-dev 
RUN apt-get -y install automake 
RUN apt-get -y install libtool 
RUN apt-get -y install bison 
RUN apt-get -y install libffi-dev 
RUN apt-get -y install imagemagick 
RUN apt-get -y install libmagickcore-dev 
RUN apt-get -y install libmagickwand-dev 
RUN apt-get -y install libicu-dev
RUN apt-get -y install software-properties-common 
RUN apt-get -y install bash
RUN apt-get -y install wkhtmltopdf
RUN apt-get -y install libmysql++-dev 
RUN apt-get -y install libmysqlclient-dev
RUN apt-get -y install mysql-client

RUN add-apt-repository ppa:ondrej/php

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -L https://get.rvm.io | bash -s stable
RUN bash -c "source /etc/profile.d/rvm.sh ; rvm install 2.1.0"
RUN bash -c "source /etc/profile.d/rvm.sh ; rvm use 2.1.0 --default"
RUN bash -c "source /etc/profile.d/rvm.sh ; gem install bundler"

WORKDIR /usr/src/osb

RUN bash -c "source /etc/profile.d/rvm.sh ; bundle install"

CMD /docker-entrypoint.sh

