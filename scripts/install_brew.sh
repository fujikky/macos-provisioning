#!/bin/sh

# Install Homebrew
if [ ! `which brew` ]; then
  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Install Homebrew packages..."

brew install \
  Caskroom/cask/1password \
  Caskroom/cask/atom \
  Caskroom/cask/docker \
  Caskroom/cask/dropbox \
  Caskroom/cask/firefox \
  Caskroom/cask/google-backup-and-sync \
  Caskroom/cask/google-chrome \
  Caskroom/cask/google-japanese-ime \
  Caskroom/cask/iterm2 \
  Caskroom/cask/sequel-pro \
  Caskroom/cask/sketch \
  Caskroom/cask/skitch \
  Caskroom/cask/slack \
  Caskroom/cask/sourcetree \
  Caskroom/cask/visual-studio-code \
  carthage \
  direnv \
  dnsmasq \
  editorconfig \
  fish \
  fzf \
  ghq \
  imagemagick \
  jq \
  mysql \
  nginx \
  peco \
  percona-toolkit \
  rbenv \
  redis \
  ruby-build \
  tree \
  wget \
  yarn

echo "Install Homebrew packages...Done!"
