#!/bin/bash -e

chef-client -c /etc/chef/client.rb -r sentry-$USERNAME
