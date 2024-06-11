#!/bin/bash -eu

echo "Install Homebrew packages..."

brew install \
  aria2 \
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
  mise \
  mysql@5.7 \
  nginx \
  openssl \
  peco \
  redis \
  ruby-build \
  tree \
  usage \
  wget

brew install --cask \
  1password \
  1password-cli \
  android-studio \
  aws-vault \
  copilot-for-xcode \
  docker \
  firefox \
  fork \
  google-chrome \
  gpg-suite \
  iterm2 \
  minecraft \
  openvpn-connect \
  session-manager-plugin \
  skitch \
  slack \
  slack-cli \
  spotify \
  tableplus \
  visual-studio-code \
  xcodes \
  zoom

echo "Install Homebrew packages...Done!"
