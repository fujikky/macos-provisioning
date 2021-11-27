#!/bin/bash -eu

if [ ! `which rustup` ]; then
  echo "Install Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
