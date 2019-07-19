# == Class: opensips::manage inherits opensips::params
#
class opensips::manage inherits opensips::params {
  service { 'rtpproxy':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
  ~> service { 'opensips':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Service['mariadb'],
  }
  -> if $db_mode == 'db' {
    exec { 'adicionar dominio':
      command => "opensipsctl domain add ${proxy_ip};opensipsctl domain reload",
      unless  =>  "opensipsctl domain show | egrep ${proxy_ip}",
      path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    }
  }
}
