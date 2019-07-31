# == Class: opensips::manage inherits opensips::params
#
class opensips::manage inherits opensips {
  require opensips::config
  if $opensips::mediaproxy_type == 'rtpproxy' {
    service { 'rtpproxy':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      before     => Service['opensips'],
      subscribe  => File['/usr/lib/systemd/system/rtpproxy.service']
    }
  }
  service { 'opensips':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Service['mariadb'],
  }
  -> if $opensips::db_mode == 'db' {
    exec { 'adicionar dominio':
      command => "opensipsctl domain add ${opensips::proxy_ip};opensipsctl domain reload",
      unless  =>  "opensipsctl domain show | egrep ${opensips::proxy_ip}",
      path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    }
  }
  exec { 'reload_rsyslog':
    command     => 'systemctl restart rsyslog',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }
}
