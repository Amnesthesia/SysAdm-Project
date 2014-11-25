FROM council/puppetbase
MAINTAINER Council of the Timeless "council@timel.es"

RUN apt-get -y -q install wget git-core
ADD Puppetfile /
ADD hiera.yaml /etc/puppet/hiera.yaml
ADD hieradata /etc/puppet/hieradata
RUN librarian-puppet install
#RUN puppet apply --modulepath=/modules -e "class{ 'apache': }"
ADD init.pp /etc/puppet/manifests/default.pp
RUN apt-get update && puppet apply --modulepath=/modules /etc/puppet/manifests/default.pp
EXPOSE 3306
CMD ["service", "mysql", "start"]
