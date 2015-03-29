#!/bin/bash -e
export HOME=/root
conjur env run -- chef-client -c /etc/chef/client.rb -o $COOKBOOK_NAME
