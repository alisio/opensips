# == Class: opensips::config
#
class opensips::config {
  require opensips::install
  class {'opensips::config::logrotate':}
  class {'opensips::config::db':}
  -> class {'opensips::config::opensips':}
  -> class {'opensips::config::syslog':}
}
