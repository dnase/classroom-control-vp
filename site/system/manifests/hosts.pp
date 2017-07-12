class system::hosts {
  Host {
    ensure => present,
  }
  resources { 'host':
    purge => true,
  }
  host { 'drewbilee.puppetlabs.vm':
    host_aliases => ['kunal'],
    ip           => '172.17.0.6',
  }
  host { 'ip6-allnodes':
    ip     => 'ff02::1',
  }
  host { 'ip6-allrouters':
    ip     => 'ff02::2',
  }
  host { 'ip6-localnet':
    ip     => 'fe00::0',
  }
  host { 'ip6-mcastprefix':
    ip     => 'ff00::0',
  }
  host { 'localhost':
    ip     => '127.0.0.1',
  }
  host { 'master.puppetlabs.vm':
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
  }
}
