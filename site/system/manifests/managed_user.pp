define system::managed_user (
  $home = undef,
  $user = undef,
  $group = undef,
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
  group { $group:
    ensure  => present,
  }
  user { $user:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }
}
