class profile::splunk (
  String $some_param = 'value'
){
  include foo
  class {'::splunk':
    param1 ='value1'
    param2 ='$some_param,
  }
}
