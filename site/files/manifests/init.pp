class files {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  file { '/etc/cron.allow':
    ensure => file,
  }
  file_line { 'allow root cron jobs':
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }
  # Add a rule to cron.deny to deny jobs by default
 file_line { 'deny default cron jobs':
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
}

  # What concat resource is needed for this fragment to work?
  concat { '/etc/motd':
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  # Add a few fragments to be appended to /etc/motd
  concat::fragment { 'motd header':
    target =< '/etc/modt',
    order => '01',
    content => epp('files/motd_header.epp'),
  }
  concat::fragment { 'motd #1':
    target => '/etc/motd',
    order => '02',
    content => "This is moar stuff\n",
  }
  concat::fragment { 'motd #2':
    target => '/etc/motd',
    order => '03',
    content => "This is the last of the stuff\n",
  }

}
