#!/bin/bash
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
    
    echo "Installing $package_name (version $package_version)..."

    if [ "$package_version" != "latest" ] ; then
        pip install "${package_name}client"=="${package_version}"
    else
        pip install "${package_name}client"
    fi

    echo "Installed"
}

# ---------------------
# Installation

$nanolayer_location install apt-get pip,python3-dev,gcc

# Install primary client
install_package python-openstack "$VERSION"

# Install other clients

# e.g., <<PROJECT>>client
projects=( \
    AODH \
    HPLEFTHAND \
    PANKO \
    TROVE \
)

# e.g., python-<<PROJECT>>client
prefixed_projects=(\
    BARBICAN \
    BLAZAR \
    CEILOMETER \
    CINDER \
    CLOUDKITTY \
    CONGRESS \
    CYBORG \
    DESIGNATE \
    FREEZER \
    GLANCE \
    GLARE \
    HEAT \
    IRONIC \
    KARBOR \
    KEYSTONE \
    MAGNUM \
    MANILA \
    MISTRAL \
    MONASCA \
    MURANO \
    NEUTRON \
    NOVA \
    OCTAVIA \
    QINLING \
    SAHARA \
    SEARCHLIGHT \
    SENLIN \
    SWIFT \
    TACKER \
    VITRAGE \
    WATCHER \
    ZAQAR \
    ZUN \
)

for project in ${projects[@]} ; do
    # ${project}  == variable name
    # ${!project} == variable value
    
    if [ -n "${!project}" ] && [ "${!project}" != "none" ] ; then
        install_package "${project}" "${!project}"
    fi
done

for project in ${prefixed_projects[@]} ; do
    # ${project}  == variable name
    # ${!project} == variable value
    
    if [ -n "${!project}" ] && [ "${!project}" != "none" ] ; then
        install_package "python-${project}" "${!project}"
    fi
done

echo 'Done!'
