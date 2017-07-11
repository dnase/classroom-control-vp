class system::hosts {
  resources {'host':
    purge => true,
  }
  
  host { 'hkanani.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['hkanani'],
    ip           => '172.17.0.7',
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
    host_aliases => [
        'localhost.localdomain',
        'localhost4',
        'localhost4.localdomain4',
        'training.puppetlabs.vm',
        'training'
        ],
    ip     => '127.0.0.1',
  }
  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
  }
}
