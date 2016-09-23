#!/bin/sh

# Install xcode-install
if [ ! `which xcversion` ]; then
  echo "Install xcode-install"
  gem install xcode-install
fi

if [ "$XCODE_INSTALL_USER" == "" ]; then
  echo "XCODE_INSTALL_USER : "
  read XCODE_INSTALL_USER
fi

if [ "$XCODE_INSTALL_PASSWORD" == "" ]; then
  echo "XCODE_INSTALL_PASSWORD : "
  read -s XCODE_INSTALL_PASSWORD
fi

echo ""
echo "Check lastest Xcode version..."

LATEST_XCODE_VERSION=$(XCODE_INSTALL_USER=${XCODE_INSTALL_USER} \
                       XCODE_INSTALL_PASSWORD=${XCODE_INSTALL_PASSWORD} \
                       xcversion list | \
                       grep -v beta | \
                       egrep "^\d+(\.\d+(\.\d+)?)?" -o | \
                       tail -n 1)

# Invalid version check
if [[ ! "${LATEST_XCODE_VERSION}" =~ ^[0-9] ]]; then
  echo "Invalid credentials! \"${LATEST_XCODE_VERSION}\""
  exit 1
fi

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
