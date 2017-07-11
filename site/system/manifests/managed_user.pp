define system::managed_user (
  $password = '$1$ocM8PbQo$B9q1dYRZhYKwrTIQaRPKS/'
) {
  $homedir = $title ? {
    'root' => '/root',
    default => "/home/$user",
  }

  user { $title:
    ensure => present,
    password => $password,
    managehome => true,
  }
  if $kernel == 'Linux' {
    file { "${homedir}/.bashrc":
      ensure => file,
      owner => $title,
      group => $title,
      mode => '0644',
      source => 'puppet:///modules/system/bashrc',
    }
  }
  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}

