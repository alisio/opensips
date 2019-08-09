#!/bin/sh
# Puppet Task Name: ctl
# "description": "Task for using opensipsctl - opensips control tool. opensipsctl is a shell script to control OpenSIPS SIP server It can be used to manage users, domains, aliases and other server options",
# "supports_noop": false,
# "input_method": "environment",
# "parameters": {
#   "command":{
#     "description": "The opensipsctl command. Eg: domain show",
#     "type": "String[1]"

PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/usr/local/bin/rtpproxy:/root/bin:/usr/local/bin:/opt/puppetlabs/bin/=
opensipsctl $PT_command
