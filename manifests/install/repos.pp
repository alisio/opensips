# == Class: opensips::install::repo
#
class opensips::install::repos inherits opensips {
  yumrepo { 'opensips':
    baseurl  => $opensips_yum_repo_baseurl,
    descr    => 'Opensips repository',
    enabled  => '1',
    gpgcheck => '0',
    # require => Package['epel-release'],
  }
  yumrepo { 'irontec':
    baseurl  => 'http://packages.irontec.com/centos/$releasever/$basearch/',
    descr    => 'irontec repository',
    enabled  => '1',
    gpgcheck => '0',
    # require => Package['epel-release'],
  }
}
