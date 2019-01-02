#!/bin/bash

# Install Homebrew
if [ ! `which go` ]; then
  echo "Install Go"
  brew install go
fi

echo "Install Go packages..."

go get github.com/motemen/ghq

echo "Install Go packages...Done!"
