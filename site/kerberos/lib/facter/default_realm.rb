require 'augeas'
Facter.add("default_realm") do
  setcode do
    Augeas::open do |aug|
      setcode "/bin/awk '/default_realm/{print $NF}' /etc/krb5.conf"
    end
    end
end 
