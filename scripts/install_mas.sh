#!/bin/bash -eu

# Install mas
if [ ! `which mas` ]; then
  echo "Install mas"
  brew install mas
fi

set +e
mas account > /dev/null 2>&1
set -e
if [ $? != 0 ] ; then
  echo -n "Apple ID: "
  read MAS_INSTALL_USER
  mas signin $MAS_INSTALL_USER
fi

echo "Install Mac App Store packages..."

mas install 1289583905 # Pixelmator Pro
mas install 1461845568 # Gifox
mas install 409183694  # Keynote
mas install 425424353  # The Unarchiver
mas install 485812721  # TweetDeck
mas install 512464723  # AS Timer
mas install 539883307  # LINE
mas install 824171161  # Affinity Designer

echo "Install Mac App Store packages...Done!"
