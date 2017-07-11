class review::motd {
  notify { 'New class motd' : }
  $local_scope_variable = "local_values"
   
  file { 'welcome-template-file':
    path    => '/tmp/motd',
    content => epp('motd.epp', { admin_variable => 'hsradmin' }),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
}
