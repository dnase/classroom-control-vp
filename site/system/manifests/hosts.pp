class system::hosts{
resources {'host':
purge => true,
}
host { 'kishanambi.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['kishanambi'],
  ip           => '172.17.0.11',
  target       => '/etc/hosts',
}
host { 'localhost':
  ensure => 'present',
  ip     => '127.0.0.1',
  target => '/etc/hosts',
}
host { 'master.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['puppet'],
  ip           => '172.17.0.1',
  target       => '/etc/hosts',
}
}
