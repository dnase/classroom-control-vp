class system::hosts {
  resources { 'host':
    purge => true,
  }
  host { 'drewbilee.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['drewbilee'],
    ip           => '172.17.0.2',
  }
  host { 'ip6-allnodes':
    ensure => 'present',
    ip     => 'ff02::1',
  }
  host { 'ip6-allrouters':
    ensure => 'present',
    ip     => 'ff02::2',
  }
  host { 'ip6-localnet':
    ensure => 'present',
    ip     => 'fe00::0',
  }
  host { 'ip6-mcastprefix':
    ensure => 'present',
    ip     => 'ff00::0',
  }
  host { 'localhost':
    ensure => 'present',
    ip     => '127.0.0.1',
  }
  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
  }
}
