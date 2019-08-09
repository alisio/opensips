#!/bin/sh
# Puppet Task Name: domainshow
# "description": "Show domain in memory using opensipsctl",

PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/usr/local/bin/rtpproxy:/root/bin:/usr/local/bin:/opt/puppetlabs/bin/=
opensipsctl domain show
