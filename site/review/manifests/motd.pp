class review::motd {
  notify { 'New class motd' : }
  
  String $local_scope_variable = "local_values"
   
  file { 'motd-file':
    path    => '/tmp/motd',
    content => epp('review/motd.epp', { admin_variable => 'hsradmin' }),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}
