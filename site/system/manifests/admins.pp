class system::admins {
    require mysql::server
  $users = {
    'zack' => {
      max_queries_per_hour => 1200,
    },
    'monica' => {},
    'brad' => {},
    'luke' => {},
    'ralph' => {
      ensure => absent,
    },
  }
  $users.each |$username, $params| {
    mysql_user { "${username}@localhost":
      ensure => pick($params['ensure'], present),
      max_queries_per_hour => pick($params['max_queries_per_hour'], 600),
    }
    user { $username:
      ensure => present,
    }
}
}
