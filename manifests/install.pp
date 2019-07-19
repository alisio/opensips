# == Class: opensips::install
#
class opensips::install {
  # resources
  class {'opensips::install::repos':}
  -> class {'opensips::install::packages':}
}
