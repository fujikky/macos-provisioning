#!/bin/bash -eu

# Tools and versions come from ~/.config/mise/config.toml, managed in dotfiles.

echo "Setup mise..."

eval "$($(brew --prefix)/bin/mise activate bash)"

mise install
mise reshim

npm i -g yarn gitmoji-cli

echo "Setup mise...Done!"
