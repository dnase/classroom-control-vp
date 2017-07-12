class system::admins {
  require mysql::server
  
  $mysql_users_present = { 'zack' => '1200', 'monica' => '600', 'brad' => '600', 'luke' => '600' }
  $mysql_users_absent = [ 'ralph' ]
  
  $mysql_users_present.each |String $mysql_each_user, String $max_queries_hour| {
     mysql_user { "${mysql_each_user}@localhost" :
       ensure => present,
       max_queries_per_hour => $max_queries_hour,
     }
  }
  
  $mysql_users_absent.each |String $mysql_each_user| {
     mysql_user { "${mysql_each_user}@localhost" :
       ensure => absent,
    }
  }
 
  user { ['zack', 'monica', 'ralph', 'brad', 'luke']:
    ensure => present,
  }
}
