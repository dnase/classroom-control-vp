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
  file { '/etc/cron.deny':
    ensure => file,
  }
  file_line { 'prevent cron jobs':
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
  # What concat resource is needed for this fragment to work?
  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
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
