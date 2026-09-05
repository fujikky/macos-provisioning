#!/bin/bash -eu

# Install mas
if ! command -v mas > /dev/null 2>&1; then
  echo "Install mas"
  brew install mas
fi

# mas signin does not work on recent macOS, so sign in from the App Store app
if ! mas account > /dev/null 2>&1; then
  echo "Sign in to the App Store."
  open -a "App Store"
  echo -n "After signing in, press enter: "
  read ENTER
fi

echo "Install Mac App Store packages..."

mas install 1289583905 # Pixelmator Pro
mas install 409183694  # Keynote
mas install 425424353  # The Unarchiver
mas install 512464723  # AS Timer
mas install 539883307  # LINE
# MeetingBar is installed as a Homebrew cask (install_brew.sh)

echo "Install Mac App Store packages...Done!"
