class role::mailserver {
  include profile::base
  include profile::base::security
  include profile::exim
  include profile::nagios
  include profile::splunk
}
