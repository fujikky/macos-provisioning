#!/bin/sh

sh scripts/create_dotfiles.sh
sh scripts/install_brew.sh
sh scripts/install_brew_cask.sh
sh scripts/install_mas.sh
sh scripts/setup_vim.sh
sh scripts/setup_ruby.sh
sh scripts/setup_node.sh
sh scripts/install_xcode.sh
