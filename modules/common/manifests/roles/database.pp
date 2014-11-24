class common::roles::database{
    include mysql::server

    create_resources('mysql::db', hiera_hash('databases'))
}
