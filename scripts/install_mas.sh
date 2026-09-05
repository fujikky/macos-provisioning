#!/bin/bash -eu

# Install mas
if ! command -v mas > /dev/null 2>&1; then
  echo "Install mas"
  brew install mas
fi

echo "Install Mac App Store packages..."

# mas cannot report whether the App Store is signed in: the account subcommand
# was removed in mas 7. Try the install and only ask when it fails.
install_app() {
  mas install "$1" && return 0

  echo ""
  echo "Could not install from the App Store. Sign in, then press enter to retry."
  open -a "App Store"
  read ENTER || { echo ""; echo "Aborted."; exit 1; }

  mas install "$1" || echo "    Failed to install $1. Continuing."
}

install_app 1289583905 # Pixelmator Pro
install_app 425424353  # The Unarchiver
install_app 512464723  # AS Timer
install_app 539883307  # LINE
# MeetingBar is installed as a Homebrew cask (install_brew.sh)

echo "Install Mac App Store packages...Done!"
