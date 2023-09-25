#!/bin/bash -eu

echo "Install Homebrew packages..."

brew install \
  aria2 \
  asdf \
  awscli \
  circleci \
  direnv \
  editorconfig \
  fish \
  fzf \
  gh \
  ghq \
  heroku/brew/heroku \
  imagemagick \
  java \
  jq \
  libmaxminddb \
  libyaml \
  mecab \
  mysql@5.7 \
  nginx \
  openssl \
  peco \
  redis \
  ruby-build \
  tree \
  wget

brew install --cask \
  1password \
  1password-cli \
  android-studio \
  authy \
  aws-vault \
  copilot-for-xcode \
  docker \
  figma \
  firefox \
  fork \
  google-chrome \
  gpg-suite \
  iterm2 \
  logitech-camera-settings \
  minecraft \
  miro \
  ngrok \
  openvpn-connect \
  redisinsight \
  session-manager-plugin \
  skitch \
  slack \
  spotify \
  tableplus \
  visual-studio-code \
  xcodes \
  zoom

echo "Install Homebrew packages...Done!"
