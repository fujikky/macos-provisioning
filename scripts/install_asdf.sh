#!/bin/bash -eu

# Install Ruby
set +e
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
# workaround: https://github.com/asdf-vm/asdf-ruby/issues/239
asdf plugin update ruby ec0b3ba17552a5223ef45709f87d5a20724b0da7
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
