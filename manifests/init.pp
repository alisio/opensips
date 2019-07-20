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

class opensips (
  $db_mode                        = $opensips::params::db_mode,
  $db_server_ip                   = $opensips::params::db_server_ip,
  $db_server_port                 = $opensips::params::db_server_port,
  $db_root_pw                     = $opensips::params::db_root_pw,
  $db_opensips_db                 = $opensips::params::db_opensips_db,
  $db_opensips_user               = $opensips::params::db_opensips_user,
  $db_opensips_pw                 = $opensips::params::db_opensips_pw,
  $opensips_advertised_address    = $opensips::params::opensips_advertised_address,
  $opensips_advertised_port       = $opensips::params::opensips_advertised_port,
  $opensips_packages              = $opensips::params::opensips_packages,
  $opensips_cfg                   = $opensips::params::opensips_cfg,
  $opensips_ctlrc                 = $opensips::params::opensips_ctlrc,
  $opensips_script_mode           = $opensips::params::opensips_script_mode,
  $opensips_yum_repo_baseurl      = $opensips::params::opensips_yum_repo_baseurl,
  $opensips_gwpadrao_hostport     = $opensips::params::opensips_gwpadrao_hostport,
  $opensips_mediaserver_hostport  = $opensips::params::opensips_mediaserver_hostport,
  $proxy_transport                = $opensips::params::proxy_transport,
  $proxy_ip                       = $opensips::params::proxy_ip,
  $proxy_port                     = $opensips::params::proxy_port,
  $proxy_eth_interface            = $opensips::params::proxy_eth_interface,
  $rtpproxy_ctrl_socket           = $opensips::params::rtpproxy_ctrl_socket,
  $rtpproxy_listen_ip             = $opensips::params::rtpproxy_listen_ip,
  $rtpproxy_min_port              = $opensips::params::rtpproxy_min_port,
  $rtpproxy_max_port              = $opensips::params::rtpproxy_max_port,
  $rtpproxy_file_limit            = $opensips::params::rtpproxy_file_limit,
  $syslog_local                   = $opensips::params::syslog_local,
  $syslog_file                    = $opensips::params::syslog_file,
) inherits opensips::params {
  # contain opensips::install
  # contain opensips::config
  # contain opensips::manage
  class {'opensips::install':}
  ~> class {'opensips::config':}
  ~> class {'opensips::manage':}
}
