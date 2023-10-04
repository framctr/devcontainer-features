#!/bin/sh
set -e

echo "Activating feature 'openstack-client'"

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

pipx_pkg_version="1.1.7"

install_package() {
    local package_name="$1"
    local package_version="$2"

    $nanolayer_location \
        install \
        devcontainer-feature \
        "ghcr.io/devcontainers-contrib/features/pipx-package:${pipx_pkg_version}" \
        --option package="${package_name}" --option version="${package_version}"
}

# Install primary client
install_package python-openstackclient "$VERSION"

# Install other packages
if [ "${OCTAVIA}" != "none" ] ; then
    install_package python-octaviaclient "$OCTAVIA"
fi

echo 'Done!'