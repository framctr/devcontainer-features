#!/bin/sh
set -e

curl -sLS https://get.k3sup.dev | sh

mv k3sup /usr/local/bin

echo 'Done!'