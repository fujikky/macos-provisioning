#!/bin/sh

# Install Homebrew
if [ ! `which brew` ]; then
  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Install Homebrew packages..."

brew install \
  awscli \
  Caskroom/cask/1password \
  Caskroom/cask/atom \
  Caskroom/cask/docker \
  Caskroom/cask/dropbox \
  Caskroom/cask/firefox \
  Caskroom/cask/google-chrome \
  Caskroom/cask/google-drive-file-stream \
  Caskroom/cask/google-japanese-ime \
  Caskroom/cask/gpg-suite \
  Caskroom/cask/iterm2 \
  Caskroom/cask/minecraft \
  Caskroom/cask/sequel-pro \
  Caskroom/cask/sketch \
  Caskroom/cask/skitch \
  Caskroom/cask/slack \
  Caskroom/cask/sourcetree \
  Caskroom/cask/visual-studio-code \
  carthage \
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
  yarn --without-node

echo "Install Homebrew packages...Done!"
