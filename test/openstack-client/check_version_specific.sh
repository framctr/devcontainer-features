#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute command" bash -c "openstack --version | grep 6.2.0"
check "execute command" bash -c "pip list installed | egrep 'python-octaviaclient.+3.5.0'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
