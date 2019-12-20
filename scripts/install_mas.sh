#!/bin/bash

# Install Homebrew
if [ ! `which mas` ]; then
  echo "Install mas"
  brew install mas
fi

mas account > /dev/null 2>&1
if [ $? != 0 ] ; then
  echo -n "Apple ID: "
  read MAS_INSTALL_USER
  mas signin $MAS_INSTALL_USER
fi

echo "Install Mac App Store packages..."

mas install 409183694  # Keynote
mas install 539883307  # LINE
mas install 425424353  # The Unarchiver
mas install 1278508951 # Trello
mas install 485812721  # TweetDeck
mas install 1295203466 # Microsoft Remote Desktop 10

echo "Install Mac App Store packages...Done!"
