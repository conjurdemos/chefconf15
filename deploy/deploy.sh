#!/bin/bash
set -e

berks vendor .vendor

conjur env run -- knife cookbook upload --all -o .vendor

rm -rf .vendor