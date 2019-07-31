# == Class: opensips::install
#
class opensips::install inherits opensips {
  # resources
  class {'opensips::install::repos':}
  -> opensips::install::packages {$opensips::opensips_packages :}
  if $opensips::mediaproxy_type == 'rtpproxy'{
    package { 'rtpproxy':
      ensure => installed,
    }
  }
}
