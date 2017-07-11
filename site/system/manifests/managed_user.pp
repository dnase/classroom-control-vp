define system::managed_user (
$password = '$1$wgACiCrb$IOnmWq8zcByfro5slWJTg1',
){
  $homedir = $title ? {
  'root' => '/root',
  default => "/home/$user",
  }
  user { $title:
    ensure => present,
    password => $password,
    managehome => true,
  }
  
  if $::kernel == 'Linux' {
    file { "${homedir}/.bashrc":
      ensure => file,
      owner => $title,
      group => $title,
      mode => '0644',
      source => 'puppet:///modules/system/bashrc'
    }
  }
}
#  if $home {
#    $homedir = $home
#  }
#  else {
#    $homedir = "/home/${name}"
#  }
#
#  File {
#    owner => $name,
#    group => 'wheel',
#    mode  => '0644',
#  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
#}
#
#system::managed_user { ['aaron', 'kaitlin', 'alison']:
#  password => $password,
#}
