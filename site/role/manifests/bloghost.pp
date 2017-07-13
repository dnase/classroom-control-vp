class role::bloghost {
  include profile::security
  include profile::wordpress
  include profile::nagios
  include profile::splunk
}
