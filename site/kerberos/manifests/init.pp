class kerberos (
  String $domain = 'PUPPETLABS.VM',
  ) {
  augeas { 'krb5.conf':
    context => '/files/etc/krb5.conf/libdefaults',
    changes => "set default_realm $domain",
  }
}
