class role::logserver {
  include profile::base
  include profile::nagios
  inlcude profile::splunk
}
