#!/bin/sh
set -e

echo "------------------------------------------------------------------------------------------------------------------------------------"
printenv
echo "------------------------------------------------------------------------------------------------------------------------------------"

su - "${_REMOTE_USER}" && whoami

echo whami
whoami

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.4"

if [ "${VERSION}" = "latest" ] ; then
   VERSION=$(curl -s https://api.github.com/repos/kubernetes-sigs/krew/releases/latest | grep "tag_name" | cut -d : -f 2,3 | tr -d \" | tr -d , | tr -d ' ')
fi

# $nanolayer_location \
#     install \
#     devcontainer-feature \
#     "ghcr.io/devcontainers-contrib/features/gh-release:1.0.23" \
#     --option repo='kubernetes-sigs/krew' --option binaryNames='kubectl-krew' --option version="$VERSION"

(
  whoami
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:${PATH}"' >> "$HOME/.bashrc"

find / -name kubectl-krew 2> /dev/null

echo 'Done!'