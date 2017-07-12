class system::admins {
  require mysql::server
  
  $admin_list = {
    'zack' => {max_queries_per_hour => 1200},
    'monica' => {max_queries_per_hour => 600},
    'brad' => {max_queries_per_hour => 600},
    'luke' => {max_queries_per_hour => 600},
  }
  
  $admin_list.each |$admin,$param| {
    mysql_user { "${admin}@localhost":
      ensure    => present,
      max_queries_per_hour  => $params['max_queries_per_hour'],
    }
    user { $user:
      ensure    => present,
    }
  }
    
  $retired_list = {
    'ralph' => {ensure = absent},
  }
  
  $retired_list.each |$admin,$param| {
    mysql_user { "${admin}@localhost":
      ensure    => absent,
    }
    user { $user:
      ensure    => present,
    }
  }
    
}
