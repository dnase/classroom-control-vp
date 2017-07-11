define system::managed_user (
  $password = '$1$U0X8V/09$Yls4C8Ted.h9QYEWRDTHf0',
) {
  $homedir = $title ? {
    'root' => '/root',
    default => "/home/$user",
  }

  File {
    owner => $name,
    group => 'wheel',
    mode  => '0644',
  }
  user { $title:
    ensure => present,
    password => $password,
    managehome => true,
  }
  if $kernel == 'Linux' {
    file { "${homedir}/.bashrc":
      ensure => file,
      source => 'puppet:///modules/system/bashrc'
      owner => $title,
      group => $title,
      mode => '0644'
    }
  }
  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}
