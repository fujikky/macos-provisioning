#!/bin/bash

export PATH="$HOME/.anyenv/bin:$PATH"

export RBENV_ROOT="$HOME/.anyenv/envs/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

export NODENV_ROOT="$HOME/.anyenv/envs/nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"

anyenv install --init
eval "$(anyenv init -)"

mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

# Install Ruby

if [ ! `which rbenv` ]; then
    echo "Install rbenv..."
    anyenv install rbenv
fi

# latest stable version
RUBY_VERSION=$(rbenv install -l | grep -v - | tail -1 | xargs)
if [[ "$(rbenv versions)" =~ "${RUBY_VERSION}" ]]; then
  echo "Ruby ${RUBY_VERSION} is already installed"
else
  echo "Install Ruby ${RUBY_VERSION}... (lastest stable version)"
  rbenv install $RUBY_VERSION
  rbenv global $RUBY_VERSION
  rbenv shell $RUBY_VERSION
fi


# Install Node

if [ ! `which nodenv` ]; then
    echo "Install nodenv..."
    anyenv install nodenv
fi

# latest LTS version
NODE_VERSION=$(curl -s https://nodejs.org/dist/index.json | jq -r '.[] | select(.lts != false) | .version' | head -1 | sed 's/^v//')
if [[ "$(nodenv versions)" =~ "${NODE_VERSION}" ]]; then
  echo "Node ${NODE_VERSION} is already installed"
else
  echo "Install Node ${NODE_VERSION}... (latest LTS version)"
  nodenv install $NODE_VERSION
  nodenv global $NODE_VERSION
fi
