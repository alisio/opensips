# == Class: opensips::config::config
#
class opensips::config::syslog inherits opensips::params {
  syslog { 'syslog opensips':
    ensure      => present,
    facility    => "local${syslog_local}",
    level       => '*',
    action_type => 'file',
    action      => $syslog_file,
    no_sync     => false,
  }
}
