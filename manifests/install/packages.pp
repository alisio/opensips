# == Class: opensips:install:packages
#
class opensips::install::packages inherits opensips::params {
  package { 'epel-release':
    ensure  => installed,
  }
  -> package { $opensips_packages:
    ensure  => installed,
    require => Yumrepo['opensips'],
  }
}
