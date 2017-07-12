class ordering::mysql {

root_password => 'strongpassword',
}
class { '::mysql::bindings':
php_enable => true,
perl_enable => true,
}
contain mysql::bindings
contain mysql::server
}
