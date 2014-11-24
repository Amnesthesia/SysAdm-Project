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
    }


}
