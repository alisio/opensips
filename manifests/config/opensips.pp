# == Class: opensips::proxy::opensips
#
class opensips::config::opensips inherits opensips {
  # resources
  file { '/usr/lib/systemd/system/opensips.service':
    ensure  => file,
    content => template('opensips/opensips.service.erb'),
    mode    => '0644',
    notify  => [Exec['reload systemctl daemon'],Service['opensips']]
  }
  -> file { $opensips::opensips_cfg:
    ensure  => file,
    mode    => '0644',
    content => template("opensips/etc/opensips/opensips-${$opensips::db_mode}-${$opensips::opensips_script_mode}.cfg.erb"),
    require => Package[$opensips::opensips_packages],
    notify  => Service['opensips']
  }
  -> file { '/etc/opensips/opensipsctlrc':
    ensure  => file,
    mode    => '0644',
    content => template("opensips/etc/opensips/opensipsctlrc-${$opensips::db_mode}.erb"),
    require => Package[$opensips::opensips_packages],
    notify  => Service['opensips']
  }
  -> file { '/usr/lib/systemd/system/rtpproxy.service':
    ensure  => file,
    content => template('opensips/rtpproxy.service.erb'),
    mode    => '0644',
    notify  => Service['rtpproxy'],
  }
  ~> exec { 'reload systemctl daemon':
    command     => 'systemctl daemon-reload',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }
}
