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

class {'opensips':
  mediaproxy_type      => 'rtpengine',
  repo_install         => true,
  db_mode              => 'nodb',
  opensips_script_mode => 'webrtc',
  tls_certificate_path => '/etc/ssl/certificate.pem',
  tls_private_key_path => '/etc/ssl/key.pem',
}
-> package { 'rtpproxy':
  ensure => absent,
}
-> class{'rtpengine':}
