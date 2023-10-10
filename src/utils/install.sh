#!/bin/sh
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

utils=""

if [ "${PING}" = "true" ] ; then
    utils="${utils} iputils-ping"
fi

if [ "${IPCALC}" = "true" ] ; then
    utils="${utils} ipcalc"
fi

if [ "${CURL}" = "true" ] ; then
    utils="${utils} curl"
fi

if [ "${WGET}" = "true" ] ; then
    utils="${utils} wget"
fi

if [ "${PIP}" = "true" ] ; then
    utils="${utils} pip"
fi

if [ "${JQ}" = "true" ] ; then
    utils="${utils} jq"
fi

if [ -n "${EXTRA_APT_PACKAGES}" ] ; then
    utils="${utils} ${EXTRA_APT_PACKAGES}"
fi

install_packages=$(echo "${utils}" | xargs | tr ' ' ',' ) # trim and replace space with comma
$nanolayer_location install apt-get "${install_packages}"

if [ "${YQ}" = "true" ] ; then
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
    chmod +x /usr/local/bin/yq
fi

echo 'Done!'