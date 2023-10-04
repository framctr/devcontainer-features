#!/bin/sh
set -e

. /etc/os-release

if [ "${UNMINIMIZE}" = "true" ] ; then
    if [ "${ID}" != "ubuntu" ] ; then
        echo "Unminimize works only on ubuntu! Found ${ID}."
        exit 1
    
    (echo y | unminimize)
fi

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

apt-get install -y $utils

if [ "${YQ}" = "true" ] ; then
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
    chmod +x /usr/local/bin/yq
fi

echo 'Done!'