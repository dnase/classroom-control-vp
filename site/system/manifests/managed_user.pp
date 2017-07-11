define system::managed_user (
  $home = undef,
  $password = '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21'
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
  if $::kernel == 'Linux' {
    file { "${homedir}/.bashrc":
      ensure => file,
      source => 'puppet:///modules/system/bashrc',
    }
  }
  user { $name:
    ensure => present,
    home => $homedir,
    password => $password,
    managehome => true,
  }
  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}
