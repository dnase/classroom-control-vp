class system::classroom {
  include system::hosts
  # export a virtual host resource for yourself
  @@host { $::fqdn:
    ip => $::ipaddress,
    host_aliases => [$::hostname],
    tag => 'classroom',
  }

  # collect all resources from the database (including your own)
  # enforce only those tagged with `classroom`.
  Host <<| tag == 'classroom' |>>
 }
