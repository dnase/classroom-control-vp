require 'augeas'
# Write a fact that returns the value of running the command
Facter.add(:default_realm) do
  Augeas::open do |aug|
    setcode aug.get('/files/etc/krb5.conf/libdefaults/default_realm')
  end
end
