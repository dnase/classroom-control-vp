## site.pp ##

# Disable filebucket by default for all File resources:
File { backup => false }

# Randomize enforcement order to help understand relationships
ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  #$message = hiera('message')
  notify { hiera("message"): }
  include role::classroom
  include system::classroom
  include ordering
  include ::files
  include ::kerberos
}
