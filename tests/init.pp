# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
#

$instalar_asterisk = false
node default {
  package { [
              'epel-release',
              'mlocate',
              'net-tools',
              'ngrep',
              'sipp',
              'telnet']:
    ensure => installed,
  }
  -> class {'selinux':
    mode => 'disabled',
  }
  -> class { 'mysql::server':
    root_password => 'opensips',
  }
  #-> class {'opensipscp':}
  -> class {'opensips':
  }
  if $instalar_asterisk {
    yumrepo { 'asterisk-common':
      descr    => 'asterisk-common',
      name     => 'asterisk-common',
      baseurl  => 'https://ast.tucny.com/repo/asterisk-common/el$releasever/$basearch/',
      enabled  => 1,
      gpgcheck => 1,
      gpgkey   => 'https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny',
    }
    -> yumrepo { 'asterisk-16':
      descr    => 'asterisk-16',
      name     => 'asterisk-16',
      baseurl  => 'https://ast.tucny.com/repo/asterisk-16/el$releasever/$basearch/',
      enabled  => 1,
      gpgcheck => 1,
      gpgkey   => 'https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny',
    }
    -> package { [
      'asterisk',
      'asterisk-sip',
      ]:
      ensure  => installed,
      require => Package['epel-release'],
    }
    file { '/etc/asterisk':
      ensure  => directory,
      recurse => remote,
      source  => 'puppet:///modules/opensips/etc/asterisk',
      owner   => 'asterisk',
      group   => 'asterisk',
      mode    => '0644',
    }
    ~> service { 'asterisk':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
    }
  }
  file { '/usr/src/sipp':
    ensure  => directory,
    recurse => remote,
    source  => 'puppet:///modules/opensips/usr/src/sipp',
    mode    => '0644',
  }
}
