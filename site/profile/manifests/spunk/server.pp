class profile::splunk::server {
  class { 'splunk':
    deploy => 'server',
    splunk_admin => 'brimus',
    splunk_admin_pass => 'password',
  }
}
