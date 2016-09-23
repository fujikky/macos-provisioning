#!/bin/sh

RUBY_VERSION=2.3.1

echo "Install ruby ${NODE_VERSION}"
rbenv install $NODE_VERSION
rbenv global $NODE_VERSION

source ~/.bashrc

echo "Install global gem packages..."

gem install \
  xcode-install \
  ec2ssh

echo "Install global gem packages...Done!"

rbenv rehash
