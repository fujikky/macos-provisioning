#!/bin/sh

# Install Homebrew
if [ ! `which brew` ]; then
  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Install Homebrew packages..."

brew install wget
brew install tree
brew install rbenv
brew install jq
brew install direnv
brew install editorconfig
brew install ruby-build
brew install nginx
brew install redis
brew install mysql
brew install imagemagick

echo "Install Homebrew packages...Done!"
