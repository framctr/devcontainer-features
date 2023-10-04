#!/bin/sh
set -e

echo "Activating feature 'openstack-client'"
OPENSTACK_CLIENT_VERSION="${VERSION}"


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

if "${OPENSTACK_CLIENT_VERSION}" != "latest" ; then
    pip install python-openstackclient=="${OPENSTACK_CLIENT_VERSION}"
else
    pip install python-openstackclient
fi