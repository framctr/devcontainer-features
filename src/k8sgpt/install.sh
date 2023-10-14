#!/bin/sh
set -e

if [ "${VERSION}" = "latest" ] ; then
   VERSION=$(curl -s https://api.github.com/repos/k8sgpt-ai/k8sgpt/releases/latest | grep "tag_name" | cut -d : -f 2,3 | tr -d \" | tr -d , | tr -d ' ')
fi

curl -LO https://github.com/k8sgpt-ai/k8sgpt/releases/download/${VERSION}/k8sgpt_amd64.deb
dpkg -i k8sgpt_amd64.deb

echo 'Done!'