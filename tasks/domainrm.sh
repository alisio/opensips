#!/bin/sh
# Puppet Task Name: domainrm
#   "domainrm": 1,
#   "description": "Remove domain from the database using opensipsctl",
#   "supports_noop": false,
#   "input_method": "environment",
#   "parameters": {
#     "domain": {
#       "description": "The domain to be removed from the database. The domains will be reloaded.",
#       "type": "String[1]"


PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/usr/local/bin/rtpproxy:/root/bin:/usr/local/bin:/opt/puppetlabs/bin/=
opensipsctl domain rm $PT_domain
opensipsctl domain reload
opensipsctl domain show
