# Write a simple function called homedir that accepts a single string argument.
# It should return the conventional Linux home directory based on a username
Puppet::Parser::Functions.newfunction(:homedir, :type => :rvalue) do |args|
  user = args[0]
  case user
    when 'root'
      return '/root'
    else
      return '/home/#{user}'
  end
end
