class system::hosts {
  # paste the output of `puppet resource host` in this class
  # and then purge unmanaged resources
  resources {'host':
     purge => true,
  }
  host { 'brimus.puppetlabs.vm':
     ensure       => 'present',
     host_aliases => ['brimus'],
     ip           => '172.17.0.13',
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
