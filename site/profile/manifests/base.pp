class profile::base {
  notify { "Hi, the server name is ${::hostname}": }
}
