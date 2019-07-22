# == Class: opensips:install:packages
#
class opensips::install::packages inherits opensips {
  package { 'epel-release':
    ensure  => installed,
  }
  -> package { $opensips::opensips_packages:
    ensure  => installed,
    require => Yumrepo['opensips'],
  }
}
