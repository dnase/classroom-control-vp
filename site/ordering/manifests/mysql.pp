class ordering::mysql {
  # How do we make sure these classes don't float off the relationship graph?
  contain ::mysql::bindings
  contain ::mysql::server
}
