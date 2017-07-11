class review::motd {
  file {'/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mod     => '0644',
    content => epp('review/motd.epp),
  }
}
