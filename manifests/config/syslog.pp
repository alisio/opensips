# == Class: opensips::config::config
#
class opensips::config::syslog inherits opensips {
  file_line { 'syslog opensips':
    ensure             => present,
    path               => '/etc/rsyslog.conf',
    line               => "local${opensips::syslog_local}.*   ${opensips::syslog_file}",
    match              => "^local${opensips::syslog_local}.*${opensips::syslog_file}",
    append_on_no_match => true,
    notify             => Exec['reload_rsyslog'],
  }
}
