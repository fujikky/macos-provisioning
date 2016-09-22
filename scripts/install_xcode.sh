#!/bin/sh

# Install xcode-install
if [ ! `which xcversion` ]; then
  echo "Install xcode-install"
  gem install xcode-install
fi

LATEST_XCODE_VERSION=$(xcversion list|tail -n 1)

if [ -e "/Applications/Xcode-${LATEST_XCODE_VERSION}.app" ]; then
  echo "Xcode ${LATEST_XCODE_VERSION} is already installed."
  exit 0
fi

echo "Install Xcode ${LATEST_XCODE_VERSION}..."

xcversion install $LATEST_XCODE_VERSION

echo "Install Xcode ${LATEST_XCODE_VERSION}...Done!"
