#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

check "execute command" bash -c "man --version"
check "execute command" bash -c "ping --version"
check "execute command" bash -c "ipcalc --version"
check "execute command" bash -c "curl --version"
check "execute command" bash -c "wget --version"
check "execute command" bash -c "pip --version"
check "execute command" bash -c "jq --version"
check "execute command" bash -c "yq --version"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults