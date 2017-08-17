#!/bin/sh

RUBY_VERSION=2.3.3

eval "$(rbenv init -)"

echo "Install ruby ${RUBY_VERSION}"
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv shell $RUBY_VERSION

echo "Install global gem packages..."

gem install \
  bundler \
  xcode-install \
  ec2ssh \
  --no-ri --no-rdoc

echo "Install global gem packages...Done!"

rbenv rehash
