#!/bin/bash -eu

# openjdk is installed by the projects that need it, so skip when absent.

echo "Setup Java..."

JDK="$(brew --prefix)/opt/openjdk/libexec/openjdk.jdk"

if [ ! -e "$JDK" ]; then
  echo "    openjdk not installed. Skipped."
  exit 0
fi

if [ ! -e /Library/Java/JavaVirtualMachines/openjdk.jdk ]; then
  sudo ln -sfn "$JDK" /Library/Java/JavaVirtualMachines/openjdk.jdk
fi

echo "Setup Java...Done!"
