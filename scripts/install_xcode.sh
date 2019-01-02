#!/bin/bash

export PATH="$HOME/.anyenv/bin:$PATH"

export RBENV_ROOT="$HOME/.anyenv/envs/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

eval "$(anyenv init -)"

# Install xcode-install
if [ ! `which xcversion` ]; then
  echo "Install xcode-install"
  gem install xcode-install
  rbenv rehash
fi

LATEST_XCODE_VERSION=""
XCODE_INSTALL_USER=""
XCODE_INSTALL_PASSWORD=""

function get_latest_xcode_version() {
  if [ "$XCODE_INSTALL_USER" == "" ]; then
    echo -n "Developer Apple ID: "
    read XCODE_INSTALL_USER
  fi

  if [ "$XCODE_INSTALL_PASSWORD" == "" ]; then
    echo -n "Password: "
    read -s XCODE_INSTALL_PASSWORD
  fi

  # update version list
  XCODE_INSTALL_USER=${XCODE_INSTALL_USER} XCODE_INSTALL_PASSWORD=${XCODE_INSTALL_PASSWORD} xcversion update

  LATEST_XCODE_VERSION=$(XCODE_INSTALL_USER=${XCODE_INSTALL_USER} \
                         XCODE_INSTALL_PASSWORD=${XCODE_INSTALL_PASSWORD} \
                         xcversion list | \
                         grep -v beta | \
                         egrep "^\d+(\.\d+(\.\d+)?)?" -o | \
                         tail -n 1)

  # Invalid version check
  if [[ ! "${LATEST_XCODE_VERSION}" =~ ^[0-9] ]]; then
    echo "Invalid credentials!"
    XCODE_INSTALL_USER=""
    XCODE_INSTALL_PASSWORD=""
    get_latest_xcode_version
  fi
}

echo "Check lastest Xcode version..."

get_latest_xcode_version

echo "Lastest Xcode version ${LATEST_XCODE_VERSION}"

if [ -e "/Applications/Xcode-${LATEST_XCODE_VERSION}.app" ]; then
  echo "Xcode ${LATEST_XCODE_VERSION} is already installed."
  exit 0
fi

echo "Install Xcode ${LATEST_XCODE_VERSION}..."

XCODE_INSTALL_USER=${XCODE_INSTALL_USER} \
XCODE_INSTALL_PASSWORD=${XCODE_INSTALL_PASSWORD} \
xcversion install ${LATEST_XCODE_VERSION}

echo "Install Xcode ${LATEST_XCODE_VERSION}...Done!"
