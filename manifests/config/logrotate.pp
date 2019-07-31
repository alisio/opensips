# == Class: opensips::config::logrotate
#
class opensips::config::logrotate inherits opensips {
  file { '/etc/logrotate.d/opensips':
    ensure  => file,
    mode    => '0644',
    content => template('opensips/etc/logrotate.d/opensips.erb'),
  }
}
