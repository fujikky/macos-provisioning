#!/bin/sh

NODE_VERSION=v5.10.1

if [ ! `which nodebrew` ]; then
  echo "Install nodebrew"
  curl -L git.io/nodebrew | perl - setup
fi

source ~/.bashrc

echo "Install node ${NODE_VERSION}"
nodebrew install-binary $NODE_VERSION
nodebrew use ${NODE_VERSION}
