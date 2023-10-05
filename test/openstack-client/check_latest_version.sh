#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "openstack --version" openstack --version
check "pip list installed | grep python-barbicanclient" pip list installed | grep python-barbicanclient
check "pip list installed | grep python-ceilometerclient" pip list installed | grep python-ceilometerclient
check "pip list installed | grep python-cinderclient" pip list installed | grep python-cinderclient
check "pip list installed | grep python-cloudkittyclient" pip list installed | grep python-cloudkittyclient
check "pip list installed | grep python-designateclient" pip list installed | grep python-designateclient
check "pip list installed | grep python-fuelclient" pip list installed | grep python-fuelclient
check "pip list installed | grep python-glanceclient" pip list installed | grep python-glanceclient
check "pip list installed | grep python-gnocchiclient" pip list installed | grep python-gnocchiclient
check "pip list installed | grep python-heatclient" pip list installed | grep python-heatclient
check "pip list installed | grep python-magnumclient" pip list installed | grep python-magnumclient
check "pip list installed | grep python-manilaclient" pip list installed | grep python-manilaclient
check "pip list installed | grep python-mistralclient" pip list installed | grep python-mistralclient
check "pip list installed | grep python-monascaclient" pip list installed | grep python-monascaclient
check "pip list installed | grep python-muranoclient" pip list installed | grep python-muranoclient
check "pip list installed | grep python-octaviaclient" pip list installed | grep python-octaviaclient
check "pip list installed | grep python-saharaclient" pip list installed | grep python-saharaclient
check "pip list installed | grep python-senlinclient" pip list installed | grep python-senlinclient
check "pip list installed | grep python-swiftclient" pip list installed | grep python-swiftclient
check "pip list installed | grep python-troveclient" pip list installed | grep python-troveclientck "openstack --version" openstack --version
check "pip list installed | grep python-barbicanclient" pip list installed | grep python-barbicanclient
check "pip list installed | grep python-ceilometerclient" pip list installed | grep python-ceilometerclient
check "pip list installed | grep python-cinderclient" pip list installed | grep python-cinderclient
check "pip list installed | grep python-cloudkittyclient" pip list installed | grep python-cloudkittyclient
check "pip list installed | grep python-designateclient" pip list installed | grep python-designateclient
check "pip list installed | grep python-fuelclient" pip list installed | grep python-fuelclient
check "pip list installed | grep python-glanceclient" pip list installed | grep python-glanceclient
check "pip list installed | grep python-gnocchiclient" pip list installed | grep python-gnocchiclient
check "pip list installed | grep python-heatclient" pip list installed | grep python-heatclient
check "pip list installed | grep python-magnumclient" pip list installed | grep python-magnumclient
check "pip list installed | grep python-manilaclient" pip list installed | grep python-manilaclient
check "pip list installed | grep python-mistralclient" pip list installed | grep python-mistralclient
check "pip list installed | grep python-monascaclient" pip list installed | grep python-monascaclient
check "pip list installed | grep python-muranoclient" pip list installed | grep python-muranoclient
check "pip list installed | grep python-octaviaclient" pip list installed | grep python-octaviaclient
check "pip list installed | grep python-saharaclient" pip list installed | grep python-saharaclient
check "pip list installed | grep python-senlinclient" pip list installed | grep python-senlinclient
check "pip list installed | grep python-swiftclient" pip list installed | grep python-swiftclient
check "pip list installed | grep python-troveclient" pip list installed | grep python-troveclient

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
