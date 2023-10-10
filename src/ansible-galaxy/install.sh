#!/bin/sh
set -e

if [ -n "${COLLECTIONS}" ] ; then
    ansible-galaxy collection install ${COLLECTIONS}
fi

echo 'Done!'