class files {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  file { '/etc/cron.allow':
    ensure => file,
  }
  file_line {'deny cron jobs':
    ensure => present,
    path => '/etc/cron.deny',
    line => '*',
    }
  file_line { 'allow root cron jobs':
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }
  # Add a rule to cron.deny to deny jobs by default
concat { '/etc/motd':
  owner => 'root',
  group => 'root',
  mode => '0644',
  }
  # What concat resource is needed for this fragment to work?
  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => epp('files/motd_header.epp'),
  }
  concat::fragment { 'motd #1':
    target => '/etc/motd',
    order => '02',
    content => "This is your conscience jk\n",
    }
  # Add a few fragments to be appended to /etc/motd
}
