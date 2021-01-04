#!/bin/bash

echo "Install Homebrew packages..."

brew install \
  anyenv \
  awscli \
  circleci \
  direnv \
  editorconfig \
  fish \
  fzf \
  gh \
  ghq \
  imagemagick \
  jq \
  peco \
  tree \
  wget

brew install --cask \
  1password \
  authy \
  browserstacklocal \
  discord \
  docker \
  dropbox \
  firefox \
  google-chrome \
  google-drive-file-stream \
  google-japanese-ime \
  gpg-suite \
  iterm2 \
  ngrok \
  sketch \
  skitch \
  slack \
  sourcetree \
  spotify \
  tableplus \
  virtualbox \
  visual-studio-code \
  zoom

echo "Install Homebrew packages...Done!"
