define system::managed_user (
  $password = '$1$jIb2kDEu$LIuiKJqSw79En7BdCc.Vv.',
) {
  $homedir = homedir($name)
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
}
