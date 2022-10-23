#!/bin/bash -eu

. $(brew --prefix asdf)/libexec/asdf.sh

# Install Ruby
set +e
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
set -e

RUBY_VERSION=$(asdf list all ruby | grep -v - | tail -1 | xargs)
asdf install ruby $RUBY_VERSION
asdf global ruby $RUBY_VERSION

# Install Node
NODE_VERSION=$(curl -s https://nodejs.org/dist/index.json | jq -r '.[] | select(.lts != false) | .version' | head -1 | sed 's/^v//')
set +e
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
set -e
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION
npm i -g yarn gitmoji-cli commitizen

# Install Go
set +e
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
set -e
asdf install golang latest
asdf global golang latest
