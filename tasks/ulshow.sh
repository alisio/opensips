#!/bin/sh
# Puppet Task Name: ulshow
# "ulshow": 1,
# "description": "Show opensips in-RAM online users",
# "supports_noop": false,
# "input_method": "environment",
# "parameters": {
  # "user": {
    # "description": "The name of the specific user to be checked",
    # "type": "Optional[String[1]]"
  # },
  # "opts":{
    # "description": "Additional options (optional). Eg: --brief",
    # "type": "Optional[String[1]]"



PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/usr/local/bin/rtpproxy:/root/bin:/usr/local/bin:/opt/puppetlabs/bin/=
opensipsctl ul show $PT_opts $PT_user
