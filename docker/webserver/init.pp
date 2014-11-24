node default{
    class{'apache': }
    class{'mysql::client': }
    user{"httpd":
        ensure => present
    }

    file{["/var/www", "/var/www/wordpress"]:
        ensure => 'directory',
    }

    $vhosts = hiera('apache::vhosts', {})
    create_resources('apache::vhost', $vhosts)
    
    $wordpress = hiera('sites',{})

    create_resources('class', $wordpress)

}
