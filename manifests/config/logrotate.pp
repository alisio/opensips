# == Class: opensips::config::logrotate
#
class opensips::config::logrotate inherits opensips {
  logrotate::rule { 'opensips':
    path         => $opensips::syslog_file,
    rotate       => 5,
    rotate_every => 'week',
    compress     => true,
    size         => '1G',
  }
}
