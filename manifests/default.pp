node default{
    # Install vim
    class{ 'vim': }
    class{ 'ohmyzsh': }
    class{ 'common': }
    ohmyzsh::install{['root', 'dev']:}
    ohmyzsh::plugins { 'dev': plugins => 'colorize git gem gitignore mysql gnu-utils' }
    ohmyzsh::theme { ['dev','root']: theme => 'avit' }


    # Install vsftpd
    class{'vsftpd':
        anonymous_enable => 'NO',
        write_enable => 'YES',
        ftpd_banner => 'SysAdm Project',
        chroot_local_user => 'YES',
    }

    class { 'docker':
        dns => '8.8.8.8',
    }~>
    docker::image{'ubuntu':
        image_tag => 'precise',
    }~>
    exec{"build-puppetbase":
        command => "/usr/bin/docker build -t='council/puppetbase' /vagrant/docker/puppetbase"
    }~>
    exec{"build-db-image": 
        command => "/usr/bin/docker build -t='council/db' /vagrant/docker/databases"
    }~>
    exec{"build-web-image":
        command => "/usr/bin/docker build -t='council/web' /vagrant/docker/webserver"
    }~>
    exec{"start-db":
        command => "/usr/bin/docker run -P -d council/db"
    }~>
    exec{"start-web":
        command => "/usr/bin/docker run -P -d council/web"
    }

}
