class ordering {
  # include the ordering::mysql class
  # Does it need to be contained?
  include ordering::mysql
  
  $var = $ordering::mysql::myvar
  
  notify { "The value is ${var}": }
  
  notify { 'This should come after the entire MySQL class is enforced':
    require => Class['ordering::mysql'],
  }
}
