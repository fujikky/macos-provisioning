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
set +e
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
set -e
asdf install nodejs lts
asdf global nodejs lts
npm i -g yarn gitmoji-cli commitizen

# Install Go
set +e
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
set -e
asdf install golang latest
asdf global golang latest
