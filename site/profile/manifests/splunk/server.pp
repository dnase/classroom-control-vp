class profile::splunk::server {
  class { 'splunk':
    deploy => 'server',
    splunk_admin => 'harrison',
    splunk _admin_pass => 'wooki3',
  }
}
