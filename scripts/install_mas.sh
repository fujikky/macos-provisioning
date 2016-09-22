#!/bin/sh

# Install Homebrew
if [ ! `which mas` ]; then
  echo "Install mas"
  brew install argon/mas/mas
fi

echo "Install Mac App Store packages..."

mas install 425424353 # The Unarchiver
mas install 485812721 # TweetDeck
mas install 539883307 # LINE
mas install 869223134 # KakaoTalk
mas install 409183694 # Keynote
mas install 494803304 # WiFi Explorer

echo "Install Mac App Store packages...Done!"
