# Write a fact that returns the value of running the command
# "/bin/awk '/default_realm/{print $NF}' /etc/krb5.conf"
require 'augeas'
Facter.add('default_realm') do
  setcode do
    Augeaus::open do |aug|
      aug.get('/files/etc/krb5.conf/libdefaults/default_realm')
    end
  end
end
