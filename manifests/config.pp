# == Class: opensips::config
#
class opensips::config {
  class {'opensips::config::logrotate':}
  class {'opensips::config::opensips':}
  -> class {'opensips::config::syslog':}

}
