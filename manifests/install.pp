# == Class: opensips::install
#
class opensips::install inherits opensips {
  if $opensips::repo_install {
    class {'opensips::install::repos':}
    -> opensips::install::packages {$opensips::opensips_packages :}
  } else {
    opensips::install::packages {$opensips::opensips_packages :}
  }
  if $opensips::mediaproxy_type == 'rtpproxy'{
    package { 'rtpproxy':
      ensure => installed,
    }
  }
}
