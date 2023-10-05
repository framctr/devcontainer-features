#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

check "execute command" bash -c "openstack --version"
check "execute command" bash -c "pip list installed | grep python-barbicanclient"
check "execute command" bash -c "pip list installed | grep python-ceilometerclient"
check "execute command" bash -c "pip list installed | grep python-cinderclient"
check "execute command" bash -c "pip list installed | grep python-cloudkittyclient"
check "execute command" bash -c "pip list installed | grep python-designateclient"
check "execute command" bash -c "pip list installed | grep python-fuelclient"
check "execute command" bash -c "pip list installed | grep python-glanceclient"
check "execute command" bash -c "pip list installed | grep python-gnocchiclient"
check "execute command" bash -c "pip list installed | grep python-heatclient"
check "execute command" bash -c "pip list installed | grep python-magnumclient"
check "execute command" bash -c "pip list installed | grep python-manilaclient"
check "execute command" bash -c "pip list installed | grep python-mistralclient"
check "execute command" bash -c "pip list installed | grep python-monascaclient"
check "execute command" bash -c "pip list installed | grep python-muranoclient"
check "execute command" bash -c "pip list installed | grep python-octaviaclient"
check "execute command" bash -c "pip list installed | grep python-saharaclient"
check "execute command" bash -c "pip list installed | grep python-senlinclient"
check "execute command" bash -c "pip list installed | grep python-swiftclient"
check "execute command" bash -c "pip list installed | grep python-troveclient"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults