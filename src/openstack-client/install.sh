#!/bin/sh
set -e

echo "Activating feature 'openstack-client'"
OPENSTACK_CLIENT_VERSION="${VERSION}"

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

require_pip() {
    if [ -z "$(which pip)" ] ; then
        apt-get update && apt-get install -y pip
    fi
}

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
# echo "The effective dev container remoteUser is '$_REMOTE_USER'"
# echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

# echo "The effective dev container containerUser is '$_CONTAINER_USER'"
# echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

require_pip
if "${OPENSTACK_CLIENT_VERSION}" != "latest" ; then
    pip install python-openstackclient=="${OPENSTACK_CLIENT_VERSION}"
else
    pip install python-openstackclient
fi