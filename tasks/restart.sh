#!/bin/sh
# Puppet Task Name: restart
# "description": "Restart OpenSIPS service",

PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/usr/local/bin/rtpproxy:/root/bin:/usr/local/bin:/opt/puppetlabs/bin/=
systemctl stop opensips
systemctl start opensips
