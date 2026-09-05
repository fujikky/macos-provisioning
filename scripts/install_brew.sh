#!/bin/bash -eu

echo "Install Homebrew packages..."

brew install \
  colima \
  deno \
  direnv \
  docker \
  docker-buildx \
  docker-compose \
  editorconfig \
  fish \
  fzf \
  gemini-cli \
  gh \
  ghq \
  heroku/brew/heroku \
  jq \
  mint \
  mise \
  peco \
  pinentry-mac \
  terminal-notifier \
  tree \
  usage \
  uv \
  wget

# --adopt takes over apps that were installed outside of Homebrew,
# which would otherwise abort the run.
brew install --cask --adopt \
  1password \
  1password-cli \
  android-studio \
  chatgpt \
  claude \
  claude-code-history-viewer \
  cleanshot \
  cloudflare-warp \
  cmux \
  codex \
  discord \
  figma \
  firefox \
  fork \
  gcloud-cli \
  google-chrome \
  gpg-suite \
  iterm2 \
  meetingbar \
  microsoft-edge \
  microsoft-remote-desktop \
  minecraft \
  miro \
  ngrok \
  notion \
  poedit \
  slack \
  spotify \
  visual-studio-code \
  xcodes-app \
  zoom

echo "Install Homebrew packages...Done!"
