node default{
    class{'mysql::server': }

    $databases = hiera('mysql::db', {})
    create_resources('mysql::db', $databases)
}
