class profile::splunk::server {
  class { 'splunk':
    deploy            => 'server',
    splunk_admin      => 'hkanani',
    splunk_admin_pass => 'hkanani123',
  }
}
