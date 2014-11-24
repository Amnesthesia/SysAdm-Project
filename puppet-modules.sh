#!/bin/bash

# Forcing modules to be reinstalled each time this is run
# to prevent it from failing if modules are already installed
puppet module install puppetlabs-stdlib --force
puppet module install puppetlabs-concat --force
puppet module install puppetlabs-apt --force
puppet module install saz-vim --force
puppet module install thias-vsftpd --force
puppet module install puppetlabs-apache --force 
puppet module install puppetlabs-mysql --force 
puppet module install garethr-docker --force
puppet module install acme-ohmyzsh --force
