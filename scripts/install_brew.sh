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
  jq \
  nginx \
  peco \
  redis \
  tree \
  wget

brew install --cask \
  1password \
  1password-cli \
  authy \
  aws-vault \
  browserstacklocal \
  docker \
  dropbox \
  firefox \
  fork \
  google-chrome \
  google-drive \
  gpg-suite \
  iterm2 \
  miro \
  ngrok \
  postman \
  redisinsight \
  redisinsight \
  session-manager-plugin \
  skitch \
  slack \
  spotify \
  tableplus \
  visual-studio-code \
  xcodes \
  zoom

# Not supported on M1 ...
# - virtualbox

echo "Install Homebrew packages...Done!"
