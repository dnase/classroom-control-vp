define system::managed_user (
  $password = '$1$Xa034BSD$nQp7orOTZaXI4pABlcqhZ/',
  $home = undef,
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

if $::kernel == 'Linux'{
  file{"${home}/.bashrc":}
  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}
