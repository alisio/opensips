# == Class: opensips::proxy::opensips
#
class opensips::config::opensips inherits opensips {
  # resources
  require opensips::install
  file { '/usr/lib/systemd/system/opensips.service':
    ensure  => file,
    content => template('opensips/opensips.service.erb'),
    mode    => '0644',
    notify  => [Exec['reload systemctl daemon'],Service['opensips']],
    before  => File[$opensips::opensips_cfg],
  }
  if $opensips::overwrite_script {
    file { $opensips::opensips_cfg:
      ensure  => file,
      mode    => '0644',
      content => template("opensips/etc/opensips/opensips-${$opensips::db_mode}-${$opensips::opensips_script_mode}.cfg.erb"),
      notify  => Service['opensips']
    }
    -> file { '/etc/opensips/opensipsctlrc':
      ensure  => file,
      mode    => '0644',
      content => template("opensips/etc/opensips/opensipsctlrc-${$opensips::db_mode}.erb"),
      notify  => Service['opensips']
    }
  } else {
    file { $opensips::opensips_cfg:
      ensure  => present,
      replace => false,
      mode    => '0644',
      content => template("opensips/etc/opensips/opensips-${$opensips::db_mode}-${$opensips::opensips_script_mode}.cfg.erb"),
      notify  => Service['opensips']
    }
    -> file { '/etc/opensips/opensipsctlrc':
      ensure  => present,
      replace => false,
      mode    => '0644',
      content => template("opensips/etc/opensips/opensipsctlrc-${$opensips::db_mode}.erb"),
      notify  => Service['opensips']
    }
  }
  if $opensips::mediaproxy_type == 'rtpproxy' {
    file { '/usr/lib/systemd/system/rtpproxy.service':
      ensure  => file,
      content => template('opensips/rtpproxy.service.erb'),
      mode    => '0644',
      require => File['/etc/opensips/opensipsctlrc'],
      notify  => Exec['reload systemctl daemon'],
    }
  }
  exec { 'reload systemctl daemon':
    command     => 'systemctl daemon-reload',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }
}
