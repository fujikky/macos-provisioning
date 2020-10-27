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
  wget

brew cask install \
  1password \
  authy \
  discord \
  docker \
  dropbox \
  firefox \
  google-chrome \
  google-drive-file-stream \
  google-japanese-ime \
  gpg-suite \
  iterm2 \
  minecraft \
  sketch \
  skitch \
  slack \
  sourcetree \
  tableplus \
  visual-studio-code \
  zoomus

echo "Install Homebrew packages...Done!"
