class role::mailserver {
  include profile::base::security
  include profile::nagios
  include profile::postfix
}
