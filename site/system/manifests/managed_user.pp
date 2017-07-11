define system::managed_user (
  $home = undef,
  $password = '$1$jIb2kDEu$LIuiKJqSw79En7BdCc.Vv.',
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
    file { "${home}/.bashrc":
      ensure => file,
      
  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}
