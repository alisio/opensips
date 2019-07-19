# == Class: alisio-opensips
#
# This class inherits the variables from opensips::params when installing,
# configuring and managing opensips and its dependencies.
#
# Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#

class opensips inherits opensips::params {
  class {'opensips::install':}
  ~> class {'opensips::config':}
  ~> class {'opensips::manage':}
}
