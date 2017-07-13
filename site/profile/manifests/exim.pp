class profile::exim {
  include clamav
  include spamd
  class { 'exim':
    source_dir       => 'puppet:///modules/example42/exim/conf/',
    source_dir_purge => true,
    use_smarthost => true,
    smarthost_route_data => 'mta.example.com',
    spam_scan => true,
    spamd_address => '127.0.0.1 783'
  }
}
