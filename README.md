SysAdm-Project
==============

Setting up a vagrant box with Puppet, letting Apache &amp; MySQL run in Docker containers

## Vagrant, Puppet & Hiera
This application should run after just executing `vagrant up`. The Vagrantfile contains the basic set-up for the vagrant image, which downloads and sets up the image, and then uses the `Puppet` provisioner to recognize the file-structure. 

When Vagrant starts up, the folder it starts from will be a `shared folder` between the host and the guest OS, and will be located in `/vagrant/` on the Guest OS. If you want to get in to the guest, you simply type `vagrant ssh` to drop into a shell.

Because Vagrant insisted on using an older version of Puppet, we also have a bashscript to fix the provisioner **before** it's run -- that's what the `upgrade-puppet.sh` script does. 

When the set-up is done, it executes the only "global" Puppet manifest found in `manifests/default.pp` which sets up some users, zsh shells, vim, and docker.

## Docker
After docker has been set up, it should proceed with building the docker applications -- and these are found in the `docker` directory.

These directories contain a directory structure like so:

* **hieradata**: Contains hiera configuration files to set up each database, vhost, user etc - to add or change, just edit these files!
* **hiera.yaml**: Specifies where Hiera will look for data files and in what order
* **init.pp**: The manifest file to be executed after Docker has spawned a container and installed Puppet modules
* **Puppetfile**: Specifies which puppet modules will be needed inside this Docker container
* **Dockerfile**: Specifies which commands to run, and files to copy into the Docker container


### Puppet inside Docker
As soon as Docker has spawned a container, it will copy files into it. These files are located in each docker-folder. `init.pp` will become `/etc/puppet/manifests/default.pp` after a container is spawned, files have been copied, essential packages and puppet modules have been installed, this file will be executed.

### Hiera
When Puppet runs within a Docker-container to set up databases or vhosts, it will look for data in the Hiera-files. Basically, Hiera will load these files as a hash, and create them as Puppet resources. For example, vhosts are created by loading all `apache::vhosts` objects and turning them into resources with Puppet.

Therefore, to add, or change, any of these - just update the .yaml files!
