# Write a fact that returns the value of running the command
Facter.add('default_realm') do
  setcode do
    default_realm = Facter::Core::Execution.exec ('/bin/awk \'/default_realm/{print $NF}\' /etc/krb5.conf')
  end
end
