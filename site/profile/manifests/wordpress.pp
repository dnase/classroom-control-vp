class profile::wordpress {
  include apa che
  include apache::mod::php
  include mysql::server
  include mysql::php
  
  class { '::wordpress':
    install_dir => '/var/www/html',
    require => Class['apache'],
  }
}
