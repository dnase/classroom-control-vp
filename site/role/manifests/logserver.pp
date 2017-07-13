class role::logserver {
  include profile::base::security
  include profile::nagios
  inlcude profile::splunk
}
