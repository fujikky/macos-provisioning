#!/bin/bash -eu

BASEDIR=$(cd $(dirname $0)/.. && pwd)

echo "Install Homebrew packages..."

# --verbose streams the output of each brew install; without it brew bundle
# captures the logs and only prints them when an entry fails.
brew bundle install --file="${BASEDIR}/Brewfile" --verbose

echo "Install Homebrew packages...Done!"
