class role::logserver {
  include profile::base
  include profile::base::security
  include profile::nagios
  include profile::splunk
  include profile::splunk::server
}
