#!/bin/sh
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

install_package() {
    local package_name=$(echo "$1" | tr '[:upper:]' '[:lower:]') # convert to lowercase
    local package_version="$2"


    $nanolayer_location install apt-get pip,python3-dev,gcc
    
    echo "Installing $package_name (version $package_version)..."

    if [ "$package_version" != "latest" ] ; then
        pip install "python-${package_name}client"=="${package_version}"
    else
        pip install "python-${package_name}client"
    fi

    echo "Installed"
}

# Install primary client
install_package openstack "$VERSION"

# Install other clients
if [ "${BARBICAN}" != "none" ] ; then
    install_package "${!BARBICAN@}" "$BARBICAN" # install the package passing the variable name and value
fi

if [ "${CEILOMETER}" != "none" ] ; then
    install_package "${!CEILOMETER@}" "$CEILOMETER" # install the package passing the variable name and value
fi

if [ "${CINDER}" != "none" ] ; then
    install_package "${!CINDER@}" "$CINDER" # install the package passing the variable name and value
fi

if [ "${CLOUDKITTY}" != "none" ] ; then
    install_package "${!CLOUDKITTY@}" "$CLOUDKITTY" # install the package passing the variable name and value
fi

if [ "${DESIGNATE}" != "none" ] ; then
    install_package "${!DESIGNATE@}" "$DESIGNATE" # install the package passing the variable name and value
fi

if [ "${FUEL}" != "none" ] ; then
    install_package "${!FUEL@}" "$FUEL" # install the package passing the variable name and value
fi

if [ "${GLANCE}" != "none" ] ; then
    install_package "${!GLANCE@}" "$GLANCE" # install the package passing the variable name and value
fi

if [ "${GNOCCHI}" != "none" ] ; then
    install_package "${!GNOCCHI@}" "$GNOCCHI" # install the package passing the variable name and value
fi

if [ "${HEAT}" != "none" ] ; then
    install_package "${!HEAT@}" "$HEAT" # install the package passing the variable name and value
fi

if [ "${MAGNUM}" != "none" ] ; then
    install_package "${!MAGNUM@}" "$MAGNUM" # install the package passing the variable name and value
fi

if [ "${MANILA}" != "none" ] ; then
    install_package "${!MANILA@}" "$MANILA" # install the package passing the variable name and value
fi

if [ "${MISTRAL}" != "none" ] ; then
    install_package "${!MISTRAL@}" "$MISTRAL" # install the package passing the variable name and value
fi

if [ "${MONASCA}" != "none" ] ; then
    install_package "${!MONASCA@}" "$MONASCA" # install the package passing the variable name and value
fi

if [ "${MURANO}" != "none" ] ; then
    install_package "${!MURANO@}" "$MURANO" # install the package passing the variable name and value
fi

if [ "${OCTAVIA}" != "none" ] ; then
    install_package "${!OCTAVIA@}" "$OCTAVIA" # install the package passing the variable name and value
fi

if [ "${SAHARA}" != "none" ] ; then
    install_package "${!SAHARA@}" "$SAHARA" # install the package passing the variable name and value
fi

if [ "${SENLIN}" != "none" ] ; then
    install_package "${!SENLIN@}" "$SENLIN" # install the package passing the variable name and value
fi

if [ "${SWIFT}" != "none" ] ; then
    install_package "${!SWIFT@}" "$SWIFT" # install the package passing the variable name and value
fi

if [ "${TROVE}" != "none" ] ; then
    install_package "${!TROVE@}" "$TROVE" # install the package passing the variable name and value
fi

echo 'Done!'