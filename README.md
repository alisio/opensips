# opensips

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with opensips](#setup)
    * [What opensips affects](#what-opensips-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with opensips](#beginning-with-opensips)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module purpose is to provision an SIP server running on the
Centos7 OS. This module was tested with puppet 5.

## Module Description

This modules install an configure a SIP server based on the Opensips proxy, asterisk
media server and mysql databse server.

## Setup

### What opensips affects

Packages installed:
* augeas
* bash-completion
* fail2ban
* opensips
* opensips-db_mysql
* opensips-httpd
* opensips-json
* opensips-proto_tls
* opensips-tls_mgm
* opensips-pua
* opensips-pua_usrloc
* rtpproxy
* sngrep
* tcpdump

Configured services:
* Opensips
* Mysql
* rtpproxy
* syslog
* logrotate

### Setup Requirements

The following modules must be installed before:
```sh
puppet module install puppetlabs-stdlib --version 5.2.0
puppet module install puppetlabs-mysql --version 10.0.0
puppet module install puppet-selinux --version 3.0.0
puppet module install puppet-logrotate --version 3.4.0
puppet module install herculesteam/augeasproviders_syslog --version 2.3.0
```

### Beginning with opensips

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).



## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

 == Variables

 These variables are set for testing purposes. You should, nay, you must change
 it in production.

 db_mode
   Specify opensips operation mode. DB or static files.

 db_server_ip
   IP address or hostname of the mysql database server.

 db_server_port
   Mysql server port.

 db_root_pw
   Password for the root password.

 db_opensips_db
   The opensips mysql database name.

 db_opensips_user
   The opensips mysql user.

 db_opensips_pw
   The password for the opensips mysql user.

 opensips_advertised_address = ''
   The external IP address or hostname of a server behind NAT.

 opensips_advertised_port=5060
   The external SIP port of a server behind NAT.

 opensips_cfg
   The path for the opensips config file

 opensips_ctlrc
   The path for the opensips control file

 opensips_script_mode
   The opensips operation mode, acording to the osipconfig utility. Accepted
   values: default, trunking, residential.

 opensips_yum_repo_baseurl
   Opensips yum repo 'http://yum.opensips.org/2.4/releases/el/7/$basearch'

 opensips_gwpadrao_hostport
   External gateway address:port (e.g. '127.0.0.1:5070')

 opensips_mediaserver_hostport
   External mediaserver address:port (e.g '127.0.0.1:5070')

 proxy_transport
   Opensips default signal transport. Accepted calues: udp, tcp, tls

 proxy_ip
   Address of the interface where opensips will listen to.

 proxy_port
   Port where opensips will listen to (e.g. 5060)

 proxy_eth_interface
   Array of ethernet interfaces where opensips will listen to. E.g ['eth0','eth2']

 rtpproxy_ctrl_socket
   Control socket composed by protocol:address:port for controlling rtpproxy.
   E.g 'udp:127.0.0.1:22222'

 rtpproxy_listen_ip
   Address where rtpproxy will listen to. E.g '0.0.0.0'

 rtpproxy_min_port
   Integer representing the lowest rtp port rtpproxy will listen to (e.g 10000)

 rtpproxy_max_port
   Integer representing the highest port rtpproxy will listen to (e.g 2000)

 rtpproxy_file_limit
   Integer representing file descriptors limit (e.g. 16000)

 syslog_local
   Syslog level (e.g. 5) for opensips and rtpproxy log

 syslog_file
   Syslog file for opensips and rtpproxy (e.g. /var/log/opensips.log)


## Limitations

This module purpose is to provision an SIP server running on the
Centos7 OS. This module was tested with puppet 5.

## Development

Please follow the licence guidelines
