# == Class: opensips::params
#
class opensips::params {
  $db_mode                      = 'db'
  $db_server_ip                 = 'localhost'
  $db_server_port               = 3306
  $db_root_pw                   = 'opensips'
  $db_opensips_db               = 'opensips'
  $db_opensips_user             = 'opensips'
  $db_opensips_pw               = 'opensipsrw'
  $mediaproxy_ctrl_socket       = 'udp:127.0.0.1:22222'
  $mediaproxy_offer_flags       = 'transcode-PCMA transcode-PCMU codec-mask-G729'
  $mediaproxy_type              = 'rtpproxy'
  $opensips_advertised_address  = ''
  $opensips_advertised_port     = 5060
  $opensips_packages            = [
                                      'augeas',
                                      'bash-completion',
                                      'fail2ban',
                                      'opensips',
                                      'opensips-db_mysql',
                                      'opensips-httpd',
                                      'opensips-json',
                                      'opensips-proto_tls',
                                      'opensips-proto_ws',
                                      'opensips-proto_wss',
                                      'opensips-rtpengine',
                                      'opensips-tls_mgm',
                                      'opensips-pua',
                                      'opensips-pua_usrloc',
                                      'sngrep',
                                      'tcpdump'
                                  ]
  $opensips_cfg                   = '/etc/opensips/opensips.cfg'
  $opensips_ctlrc                 = '/etc/opensips/opensipsctlrc'
  $opensips_script_mode           = 'default' # default, trunking, residentia
  $opensips_http_mi_port          = 8888
  $opensips_yum_repo_baseurl      = 'http://yum.opensips.org/2.4/releases/el/7/$basearch'
  $opensips_defaultgw_hostport    = '127.0.0.1:5070'
  $opensips_mediaserver_hostport  = '127.0.0.1:5070'
  $proxy_module_ratelimit_enable  = true
  $proxy_module_ratelimit_limit   = 10
  $proxy_transport                = 'udp'
  $proxy_ip                       = $facts['ipaddress']
  $proxy_port                     = 5060
  $proxy_eth_interface            = $facts['interfaces']
  $repo_install                   = true
  $rtpengine_listen_interface     = $facts['ipaddress']
  $rtpengine_min_port             = 30000
  $rtpengine_max_port             = 40000
  $rtpengine_max_sessions         = 16000
  $rtpproxy_listen_ip             = '0.0.0.0'
  $rtpproxy_min_port              = 10000
  $rtpproxy_max_port              = 20000
  $rtpproxy_file_limit            = 16000
  $syslog_local                   = 5
  $syslog_file                    = '/var/log/opensips.log'
  $tls_certificate_path           = '/etc/letsencrypt/live/acme.com/cert.pem'
  $tls_private_key_path           = '/etc/letsencrypt/live/acme.com/privkey.pem'
  $webrtc_ws_port                 = '8080'
  $webrtc_wss_port                = '4443'
}
