define system::managed_user (
  $home = undef,
  $password = '$1$NQHaH4nA$PcH8AgkUKw67x1gzpYq7k1',
  
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
  user { $name:
    ensure => present,
    home => $homedir,
    password => $password,
    managehome => true,
  }

}
