FROM ubuntu:12.04
MAINTAINER Amnesthesia "amnesthesia@nope.no"

RUN apt-get -y update
RUN apt-get -y install build-essential automake ruby1.9.3 ruby
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet librarian-puppet
