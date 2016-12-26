#!/bin/sh

RUBY_VERSION=2.3.1

echo "Install ruby ${RUBY_VERSION}"
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

source ~/.bashrc

echo "Install global gem packages..."

gem install \
  xcode-install \
  ec2ssh

echo "Install global gem packages...Done!"

rbenv rehash
