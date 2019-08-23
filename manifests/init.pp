# @summary This provisions a SIP server running on Centos 7
#
# @example Basic usage
#
# include opensips
#
# Change detault SIP listening port to 5066:
# class{'opensips':
#   proxy_port => 5066,
# }
#
# Change the default media proxy:
# class{'opensips':
#   mediaproxy_type => 'rtpproxy',
# }
#
# Parameters
#
# @db_server_ip
#   IP address or hostname of the mysql database server.
# @db_server_port
#   Mariadb server port.
# @db_root_pw
#   Database root password.
# @db_opensips_db
#   The opensips mysql database name.
# @db_opensips_user
#   The opensips mysql user.
# @db_opensips_pw
#   The password for the opensips mysql user.
# @mediaproxy_type
#   Set which mediaproxy wil be used. Accepted values are 'rtpproxy' or 'rtpengine'. Default to rtpproxy
# @mediaproxy_ctrl_socket
#   String containing either just a port number, or an address:port pair, separated
#   by colon, of the control socket. Default to 'udp:127.0.0.1:22222'
# @mediaproxy_offer_flags
#   The “flags” string is a list of space-separated items. Each item is either an
#   individual token, or a token in “key=value” format. Default to 'transcode-PCMA
#   transcode-PCMU codec-mask-G729'
# @opensips_advertised_address
#   The external IP address or hostname of a server behind NAT.
# @opensips_advertised_port
#   The external SIP port of a server behind NAT.
# @opensips_cfg
#   The path for the opensips config file
# @opensips_ctlrc
#   The path for the opensips control file
# @opensips_http_mi_port
#   Opensips HTTP Manager Interface Port. Default value: 8888
# @opensips_script_mode
#   The opensips operation mode, acording to the osipconfig utility. Accepted values: default, trunking, residential.
# @opensips_yum_repo_baseurl
#   Opensips 2.4 yum repo 'http://yum.opensips.org/2.4/releases/el/7/$basearch'
# @opensips_defaultgw_hostport
#   External gateway address:port (e.g. '127.0.0.1:5070')
# @opensips_mediaserver_hostport
#   External mediaserver address:port (e.g '127.0.0.1:5070')
# @proxy_transport
#   Opensips default signal transport. Accepted calues: udp, tcp, tls
# @proxy_ip
#   Address of the interface where opensips will listen to.
# @proxy_module_ratelimit_enable
#   Enable/disable the ratelimit module for implemeting rate limiting for SIP requests. Default value: true
# @$proxy_module_ratelimit_limit
#   threshold limit per second for the ratelimit module. Default value: 100
# @proxy_port
#   Port where opensips will listen to (e.g. 5060)
# @proxy_eth_interface
#   Array of ethernet interfaces where opensips will listen to. E.g ['eth0','eth2']
#
# Parameters for use only when media proxy rtpengine (the default) is set.
# @rtpengine_listen_interface
#   Specifies a local network interface for listening to the RTP packets. Default to the Ip address of the first ethernet interface
# @rtpengine_min_port
#   Integer defining the minimum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 30000.
# @rtpengine_max_port
#   Integer defining the maximum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 40000.
# @rtpengine_max_sessions
#   Integer defining the limit the number of maximum concurrent sessions. Default to 16000
#
# Parameters for use only when media proxy rtpproxy is set.
#   Control socket composed by protocol:address:port for controlling rtpproxy. E.g 'udp:127.0.0.1:22222'
# @rtpproxy_listen_ip
#   Address where rtpproxy will listen to. E.g '0.0.0.0'
# @rtpproxy_min_port
#   Integer representing the lowest rtp port rtpproxy will listen to (e.g 10000)
# @rtpproxy_max_port
#   Integer representing the highest port rtpproxy will listen to (e.g 2000)
# @rtpproxy_file_limit
#   Integer representing file descriptors limit (e.g. 16000)
# @syslog_local
#   Syslog level (e.g. 5) for opensips and rtpproxy log
# @syslog_file
#   Syslog file for opensips and rtpproxy (e.g. /var/log/opensips.log)


# Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>
#
# === Copyright
#
# Copyright 2019 Your name here, unless otherwise noted.
#

class opensips (
  $db_mode                        = $opensips::params::db_mode,
  $db_server_ip                   = $opensips::params::db_server_ip,
  $db_server_port                 = $opensips::params::db_server_port,
  $db_root_pw                     = $opensips::params::db_root_pw,
  $db_opensips_db                 = $opensips::params::db_opensips_db,
  $db_opensips_user               = $opensips::params::db_opensips_user,
  $db_opensips_pw                 = $opensips::params::db_opensips_pw,
  $mediaproxy_ctrl_socket          = $opensips::params::mediaproxy_ctrl_socket,
  $mediaproxy_type                = $opensips::params::mediaproxy_type,
  $opensips_advertised_address    = $opensips::params::opensips_advertised_address,
  $opensips_advertised_port       = $opensips::params::opensips_advertised_port,
  $opensips_packages              = $opensips::params::opensips_packages,
  $opensips_cfg                   = $opensips::params::opensips_cfg,
  $opensips_ctlrc                 = $opensips::params::opensips_ctlrc,
  $opensips_http_mi_port          = $opensips::params::opensips_http_mi_port,
  $opensips_script_mode           = $opensips::params::opensips_script_mode,
  $opensips_yum_repo_baseurl      = $opensips::params::opensips_yum_repo_baseurl,
  $opensips_defaultgw_hostport    = $opensips::params::opensips_defaultgw_hostport,
  $opensips_mediaserver_hostport  = $opensips::params::opensips_mediaserver_hostport,
  $proxy_module_ratelimit_enable  = $opensips::params::proxy_module_ratelimit_enable,
  $proxy_module_ratelimit_limit   = $opensips::params::proxy_module_ratelimit_limit,
  $proxy_transport                = $opensips::params::proxy_transport,
  $proxy_ip                       = $opensips::params::proxy_ip,
  $proxy_port                     = $opensips::params::proxy_port,
  $proxy_eth_interface            = $opensips::params::proxy_eth_interface,
  $repo_install                   = $opensips::params::repo_install,
  $rtpengine_listen_interface     = $opensips::params::rtpengine_listen_interface,
  $rtpengine_min_port             = $opensips::params::rtpengine_min_port,
  $rtpengine_max_port             = $opensips::params::rtpengine_max_port,
  $rtpengine_max_sessions         = $opensips::params::rtpengine_max_sessions,
  $rtpproxy_listen_ip             = $opensips::params::rtpproxy_listen_ip,
  $rtpproxy_min_port              = $opensips::params::rtpproxy_min_port,
  $rtpproxy_max_port              = $opensips::params::rtpproxy_max_port,
  $rtpproxy_file_limit            = $opensips::params::rtpproxy_file_limit,
  $syslog_local                   = $opensips::params::syslog_local,
  $syslog_file                    = $opensips::params::syslog_file,
  $tls_certificate_path           = $opensips::params::tls_certificate_path,
  $tls_private_key_path           = $opensips::params::tls_private_key_path,
  $webrtc_ws_port                 = $opensips::params::webrtc_ws_port,
  $webrtc_wss_port                = $opensips::params::webrtc_wss_port,
) inherits opensips::params {
  class {'opensips::install':}
  ~> class {'opensips::config':}
  ~> class {'opensips::manage':}
}
