node default{
    class{'apache': }
    user{"httpd":
        ensure => present
    }

    file{["/var/www", "/var/www/wp"]:
        ensure => 'directory',
    }

    $vhosts = hiera('apache::vhosts', {})
    create_resources('apache::vhost', $vhosts)
    
    $wordpress = hiera('sites',{})

    create_resources('class', $wordpress)

}
