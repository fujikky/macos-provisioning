#!/bin/bash

# Install Homebrew
if [ ! `which brew` ]; then
  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Install Homebrew packages..."

brew install \
  anyenv \
  awscli \
  carthage \
  circleci \
  direnv \
  editorconfig \
  fish \
  fzf \
  ghq \
  imagemagick \
  jq \
  peco \
  tree \
  wget \
  yarn

brew cask install \
  1password \
  atom \
  docker \
  dropbox \
  firefox \
  google-chrome \
  google-drive-file-stream \
  google-japanese-ime \
  gpg-suite \
  iterm2 \
  minecraft \
  sequel-pro \
  sketch \
  skitch \
  slack \
  sourcetree \
  visual-studio-code

echo "Install Homebrew packages...Done!"
