define system::managed_user (
  $home = undef,
  $password = '$1$LATXwgUC$CVVzqo/KFFRV9Ntp2sZEY0',
) {
  if $home {
    $homedir = $home
  }
  else {
    $homedir = "/home/${name}"
  }

  File {
    owner => $name,
    group => 'wheel',
    mode  => '0644',
  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
  
  if $::kernel == 'Linux' {
    file { "${home}/.bashrc" :
      ensure => file,
      source => 'puppet://modules/system/bashrc',
    }
  }
  User { $name :
    ensure => present,
    home => $homedir,
    managehome => true,
    password => $password,
  }
}
