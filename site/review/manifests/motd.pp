class review::motd {
 {'/etc/motd':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  content =>('review/motd.epp'),
  }
}
