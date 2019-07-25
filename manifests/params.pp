# == Class: opensips::params
#
#
# == Variables
#
# These variables are set for testing purposes. You should, nay, you must change
# it in production.
#
# db_mode
#   Specify opensips operation mode. DB or static files.
#
# db_server_ip
#   IP address or hostname of the mysql database server.
#
# db_server_port
#   Mysql server port.
#
# db_root_pw
#   Password for the root password.
#
# db_opensips_db
#   The opensips mysql database name.
#
# db_opensips_user
#   The opensips mysql user.
#
# db_opensips_pw
#   The password for the opensips mysql user.
#
# opensips_advertised_address = ''
#   The external IP address or hostname of a server behind NAT.
#
# opensips_advertised_port=5060
#   The external SIP port of a server behind NAT.
#
# opensips_cfg
#   The path for the opensips config file
#
# opensips_ctlrc
#   The path for the opensips control file
#
# opensips_script_mode
#   The opensips operation mode, acording to the osipconfig utility. Accepted
#   values: default, trunking, residential.
#
# opensips_yum_repo_baseurl
#   Opensips yum repo 'http://yum.opensips.org/2.4/releases/el/7/$basearch'
#
# opensips_defaultgw_hostport
#   External gateway address:port (e.g. '127.0.0.1:5070')
#
# opensips_mediaserver_hostport
#   External mediaserver address:port (e.g '127.0.0.1:5070')
#
# proxy_transport
#   Opensips default signal transport. Accepted calues: udp, tcp, tls
#
# proxy_ip
#   Address of the interface where opensips will listen to.
#
# proxy_port
#   Port where opensips will listen to (e.g. 5060)
#
# proxy_eth_interface
#   Array of ethernet interfaces where opensips will listen to. E.g ['eth0','eth2']
#
# rtpproxy_ctrl_socket
#   Control socket composed by protocol:address:port for controlling rtpproxy.
#   E.g 'udp:127.0.0.1:22222'
#
# rtpproxy_listen_ip
#   Address where rtpproxy will listen to. E.g '0.0.0.0'
#
# rtpproxy_min_port
#   Integer representing the lowest rtp port rtpproxy will listen to (e.g 10000)
#
# rtpproxy_max_port
#   Integer representing the highest port rtpproxy will listen to (e.g 2000)
#
# rtpproxy_file_limit
#   Integer representing file descriptors limit (e.g. 16000)
#
# syslog_local
#   Syslog level (e.g. 5) for opensips and rtpproxy log
#
# syslog_file
#   Syslog file for opensips and rtpproxy (e.g. /var/log/opensips.log)
#
#
class opensips::params {
  $db_mode='db'
  $db_server_ip = 'localhost'
  $db_server_port = 3306
  $db_root_pw = 'opensips'
  $db_opensips_db = 'opensips'
  $db_opensips_user = 'opensips'
  $db_opensips_pw = 'opensipsrw'
  $opensips_advertised_address = ''
  $opensips_advertised_port=5060
  $opensips_packages = [
                          'augeas',
                          'bash-completion',
                          'fail2ban',
                          'opensips',
                          'opensips-db_mysql',
                          'opensips-httpd',
                          'opensips-json',
                          'opensips-proto_tls',
                          'opensips-tls_mgm',
                          'opensips-pua',
                          'opensips-pua_usrloc',
                          'rtpproxy',
                          'sngrep',
                          'tcpdump'
                        ]
  $opensips_cfg = '/etc/opensips/opensips.cfg'
  $opensips_ctlrc = '/etc/opensips/opensipsctlrc'
  $opensips_script_mode = 'default' # default, trunking, residentia
  $opensips_http_mi_port = 8888
  $opensips_yum_repo_baseurl = 'http://yum.opensips.org/2.4/releases/el/7/$basearch'
  $opensips_defaultgw_hostport = '127.0.0.1:5070'
  $opensips_mediaserver_hostport = '127.0.0.1:5070'
  $proxy_transport = 'udp'
  $proxy_ip             = $facts['ipaddress']
  $proxy_port           = 5060
  $proxy_eth_interface  = $facts['interfaces']
  $rtpproxy_ctrl_socket = 'udp:127.0.0.1:22222'
  $rtpproxy_listen_ip   = '0.0.0.0'
  $rtpproxy_min_port    = 10000
  $rtpproxy_max_port    = 20000
  $rtpproxy_file_limit  = 16000
  $syslog_local         = 5
  $syslog_file          = '/var/log/opensips.log'
}
