#!/bin/bash
set -e

conjur env check

berks vendor .vendor

conjur env run -- knife cookbook upload --all -o .vendor

rm -rf .vendor