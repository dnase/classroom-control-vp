class webapp::wordpress {
  class { '::wordpress':
    install_url => 'http://10.0.0.1',
  }
  class { '::webapp':
    docroot => '/opt/wordpress',
    app_name => 'wordpress',
  }  
}
