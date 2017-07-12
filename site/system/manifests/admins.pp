class system::admins {
  require mysql::server
  $retired = ['ralph']
  $admins = {
  'zack' => {max_queries_per_hour => 1200},
  'monica' => {max_queries_per_hour => 600},
  'brad' => {max_queries_per_hour => 600},
  'luke' => {max_queries_per_hour => 600},
   }
  $admins.each|$user,$params|{
  mysql_user {"${username}@localhost":
    ensure => present,
    max_queries_per_hour => $params['max_queries_per_hour'],
    }
  user {$user:
    ensure => present,
  }
}
  $retired.each |$user| {
  mysql_user { "${user}@localhost":
  ensure => absent,
}
  user { $user:
  ensure => absent,
}
}
}

