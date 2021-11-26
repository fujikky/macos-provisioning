#!/bin/bash

# Install Ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
RUBY_VERSION=$(asdf list all ruby | grep -v - | tail -1 | xargs)
asdf install ruby $RUBY_VERSION
asdf global ruby $RUBY_VERSION

# Install Node
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts
npm i -g yarn gitmoji-cli commitizen
