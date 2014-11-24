class common{
    # Get stuff from hiera
    hiera_include('classes')

    # Create user
    create_resources('user', hiera_hash('users'))
}
