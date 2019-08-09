#!/bin/sh
# Puppet Task Name: domainadd
# "description": "Add domain to the database using opensipsctl",
# "supports_noop": false,
# "input_method": "environment",
# "parameters": {
#   "domain": {
#     "description": "The domain to be added to the database. The domain will be reloaded after added",
PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/usr/local/bin/rtpproxy:/root/bin:/usr/local/bin:/opt/puppetlabs/bin/=
opensipsctl domain add $PT_domain
opensipsctl domain reload
opensipsctl domain show
