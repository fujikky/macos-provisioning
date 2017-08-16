#!/bin/sh

# Install Homebrew
if [ ! `which brew` ]; then
  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Install Homebrew packages..."

brew install \
  fish \
  wget \
  tree \
  jq \
  editorconfig \

  # server
  rbenv \
  ruby-build \
  direnv \
  mysql \
  redis \
  nginx \
  percona-toolkit \
  imagemagick \
  dnsmasq \

  # fe
  yarn \

  # ios
  swiftlint \
  carthage \

  # cask
  Caskroom/cask/docker \
  Caskroom/cask/dropbox \
  Caskroom/cask/google-chrome \
  Caskroom/cask/google-japanese-ime \
  Caskroom/cask/google-backup-and-sync \
  Caskroom/cask/firefox \
  Caskroom/cask/iterm2 \
  Caskroom/cask/atom \
  Caskroom/cask/sourcetree \
  Caskroom/cask/sequel-pro \
  Caskroom/cask/skitch \
  Caskroom/cask/sketch \
  Caskroom/cask/slack \
  Caskroom/cask/visual-studio-code \
  Caskroom/cask/1password

echo "Install Homebrew packages...Done!"
