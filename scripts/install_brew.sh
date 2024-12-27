#!/bin/bash -eu

echo "Install Homebrew packages..."

brew install \
  aria2 \
  awscli \
  coreutils \
  deno \
  direnv \
  editorconfig \
  fish \
  fzf \
  gh \
  ghq \
  heroku/brew/heroku \
  imagemagick \
  jq \
  libmaxminddb \
  libyaml \
  mecab \
  mint \
  mise \
  mysql@8.0 \
  nginx \
  openjdk \
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
  arc \
  aws-vault \
  chatgpt \
  copilot-for-xcode \
  docker \
  figma \
  firefox \
  fork \
  google-chrome \
  google-cloud-sdk \
  gpg-suite \
  iterm2 \
  meetingbar \
  microsoft-edge \
  minecraft \
  miro \
  ngrok \
  openvpn-connect \
  session-manager-plugin \
  slack \
  slack-cli \
  spotify \
  tableplus \
  visual-studio-code \
  warp \
  xcodes \
  zoom

echo "Install Homebrew packages...Done!"
