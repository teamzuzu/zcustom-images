#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

cd /home/github

if [ "$1" = "" ]; then
  echo "no target passed"
  exit
fi

if [ "$1" = "linux/amd64"]; then
  TARGET=x64
else
  TARGET=arm64
fi

VERSION=$(curl --silent "https://api.github.com/repos/actions/runner/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed s/^v//)

printf "$TARGET $VERSION"

curl -O -L https://github.com/actions/runner/releases/download/v$VERSION/actions-runner-linux-$TARGET-$VERSION.tar.gz
tar xzf ./actions-runner-linux-*-*.tar.gz

# this version of icu isn't included in the dependencies script
apt -y install libicu76

./bin/installdependencies.sh

# fix ownership
sudo chown -R github  /home/github
