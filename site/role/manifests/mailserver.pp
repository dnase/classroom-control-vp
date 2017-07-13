class role::mailserver {
  include profile::base
  include profile::nagios
  include profile::postfix
  include profile::splunk::forwarder
}
