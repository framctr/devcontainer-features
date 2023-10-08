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
projects=( \
    BARBICAN \
    CEILOMETER \
    CINDER \
    CLOUDKITTY \
    DESIGNATE \
    FUEL \
    GLANCE \
    GNOCCHI \
    HEAT \
    MAGNUM \
    MANILA \
    MISTRAL \
    MONASCA \
    MURANO \
    OCTAVIA \
    SAHARA \
    SENLIN \
    SWIFT \
    TROVE \
)

for project in ${projects[@]} ; do
    # ${project}  # variable name
    # ${!project} # variable value
    
    if [ -n "${!project}" ] && [ "${!project}" != "none" ] ; then
        install_package "${project}" "${!project}"
    fi
done


# if [ -n "${BARBICAN}" ] && [ "${BARBICAN}" != "none" ] ; then
#     install_package "${!BARBICAN@}" "$BARBICAN" # install the package passing the variable name and value
# fi

# if [ -n "${CEILOMETER}" ] && [ "${CEILOMETER}" != "none" ] ; then
#     install_package "${!CEILOMETER@}" "$CEILOMETER" # install the package passing the variable name and value
# fi

# if [ -n "${CINDER}" ] && [ "${CINDER}" != "none" ] ; then
#     install_package "${!CINDER@}" "$CINDER" # install the package passing the variable name and value
# fi

# if [ -n "${CLOUDKITTY}" ] && [ "${CLOUDKITTY}" != "none" ] ; then
#     install_package "${!CLOUDKITTY@}" "$CLOUDKITTY" # install the package passing the variable name and value
# fi

# if [ -n "${DESIGNATE}" ] && [ "${DESIGNATE}" != "none" ] ; then
#     install_package "${!DESIGNATE@}" "$DESIGNATE" # install the package passing the variable name and value
# fi

# if [ -n "${FUEL}" ] && [ "${FUEL}" != "none" ] ; then
#     install_package "${!FUEL@}" "$FUEL" # install the package passing the variable name and value
# fi

# if [ -n "${GLANCE}" ] && [ "${GLANCE}" != "none" ] ; then
#     install_package "${!GLANCE@}" "$GLANCE" # install the package passing the variable name and value
# fi

# if [ -n "${GNOCCHI}" ] && [ "${GNOCCHI}" != "none" ] ; then
#     install_package "${!GNOCCHI@}" "$GNOCCHI" # install the package passing the variable name and value
# fi

# if [ -n "${HEAT}" ] && [ "${HEAT}" != "none" ] ; then
#     install_package "${!HEAT@}" "$HEAT" # install the package passing the variable name and value
# fi

# if [ -n "${MAGNUM}" ] && [ "${MAGNUM}" != "none" ] ; then
#     install_package "${!MAGNUM@}" "$MAGNUM" # install the package passing the variable name and value
# fi

# if [ -n "${MANILA}" ] && [ "${MANILA}" != "none" ] ; then
#     install_package "${!MANILA@}" "$MANILA" # install the package passing the variable name and value
# fi

# if [ -n "${MISTRAL}" ] && [ "${MISTRAL}" != "none" ] ; then
#     install_package "${!MISTRAL@}" "$MISTRAL" # install the package passing the variable name and value
# fi

# if [ -n "${MONASCA}" ] && [ "${MONASCA}" != "none" ] ; then
#     install_package "${!MONASCA@}" "$MONASCA" # install the package passing the variable name and value
# fi

# if [ -n "${MURANO}" ] && [ "${MURANO}" != "none" ] ; then
#     install_package "${!MURANO@}" "$MURANO" # install the package passing the variable name and value
# fi

# if [ -n "${OCTAVIA}" ] && [ "${OCTAVIA}" != "none" ] ; then
#     install_package "${!OCTAVIA@}" "$OCTAVIA" # install the package passing the variable name and value
# fi

# if [ -n "${SAHARA}" ] && [ "${SAHARA}" != "none" ] ; then
#     install_package "${!SAHARA@}" "$SAHARA" # install the package passing the variable name and value
# fi

# if [ -n "${SENLIN}" ] && [ "${SENLIN}" != "none" ] ; then
#     install_package "${!SENLIN@}" "$SENLIN" # install the package passing the variable name and value
# fi

# if [ -n "${SWIFT}" ] && [ "${SWIFT}" != "none" ] ; then
#     install_package "${!SWIFT@}" "$SWIFT" # install the package passing the variable name and value
# fi

# if [ -n "${TROVE}" ] && [ "${TROVE}" != "none" ] ; then
#     install_package "${!TROVE@}" "$TROVE" # install the package passing the variable name and value
# fi

echo 'Done!'