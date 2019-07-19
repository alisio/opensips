# == Class: opensips::config::logrotate
#
class opensips::config::logrotate inherits opensips::params {
  logrotate::rule { 'opensips':
    path         => $syslog_file,
    rotate       => 5,
    rotate_every => 'week',
    compress     => true,
    size         => '1G',
  }
}
