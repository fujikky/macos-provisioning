#!/bin/bash

echo "Create dotfiles..."

cd ${PWD}/dotfiles
mkdir -p "${HOME}/.config"
files=(.gitignore_global .vim .vimrc .config/fish)
for dotfile in ${files[@]}; do
  echo "    ${HOME}/${dotfile}"
  rm -rf ${HOME}/${dotfile}
  ln -s "$PWD/$dotfile" "$HOME/$dotfile"
done

echo "Create dotfiles...Done!"
