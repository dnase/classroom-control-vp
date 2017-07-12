class system::admins_pick {  
  require mysql::server
  
  $default_max_queries_per_hour = '600'
  
   $retired = [ 'ralph' ]  
   $admins  = {    
   'brad'   => {},    
   'monica' => {},    
   'luke'   => {},    
   'zack'   => { max_queries_per_hour => '1200' },  
  }
 
 
