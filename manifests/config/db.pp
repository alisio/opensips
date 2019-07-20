# == Class: opensips::config::db
#
class opensips::config::db inherits opensips {
  class { 'mysql::server':
    root_password => 'opensips',
  }
  -> file { '/etc/opensips/opensips_db.sql':
    ensure => file,
    source => 'puppet:///modules/opensips/etc/opensips/opensips_db.sql',
    mode   => '0644',
  }
  -> mysql::db { $db_opensips_db:
    user           => $db_opensips_user,
    password       => $db_opensips_pw,
    host           => $db_server_ip,
    grant          => ['ALL'],
    sql            => '/etc/opensips/opensips_db.sql',
    import_cat_cmd => 'cat',
    import_timeout => 900,
  }
}
