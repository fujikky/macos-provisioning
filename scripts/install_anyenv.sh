#!/bin/bash

export PATH="$HOME/.anyenv/bin:$PATH"

export RBENV_ROOT="$HOME/.anyenv/envs/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

export NDENV_ROOT="$HOME/.anyenv/envs/ndenv"
export PATH="$NDENV_ROOT/bin:$PATH"

if [ ! `which anyenv` ]; then
  echo "Install anyenv..."
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

eval "$(anyenv init -)"

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

if [ ! `which ndenv` ]; then
    echo "Install ndenv..."
    anyenv install ndenv
fi

# latest LTS version
NODE_VERSION=$(curl -s https://nodejs.org/dist/index.json | jq -r '.[] | select(.lts != false) | .version' | head -1)
if [[ "$(ndenv versions)" =~ "${NODE_VERSION}" ]]; then
  echo "Node ${NODE_VERSION} is already installed"
else
  echo "Install Node ${NODE_VERSION}... (latest LTS version)"
  ndenv install $NODE_VERSION
  ndenv global $NODE_VERSION
fi
