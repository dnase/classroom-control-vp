class review::motd {
  notify { 'New class motd' : }
  
  file { 'welcome-template-file':
    path    => '/tmp/motd',
    content => epp('tmp/motd'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
}
