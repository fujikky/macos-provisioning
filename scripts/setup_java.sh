#!/bin/bash -eu

echo "Setup Java..."

if [ ! -e /Library/Java/JavaVirtualMachines/openjdk.jdk ]; then
  sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi

echo "Setup Java...Done!"
