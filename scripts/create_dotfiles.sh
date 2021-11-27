#!/bin/bash -eu

echo "Create dotfiles..."

cd ${PWD}/dotfiles

echo ""
echo "files in \$HOME:"
for dotfile in `find . -mindepth 1 -maxdepth 1 -not -name '.config'`; do
  dotfile=$(echo $dotfile | sed 's/^\.\///')
  from="${PWD}/${dotfile}"
  dest="${HOME}/${dotfile}"
  echo "    $dest -> $from"
  rm -rf $dest
  ln -s $from $dest
done

echo ""
echo "files in \$HOME/.config:"
mkdir -p "${HOME}/.config"
for dotfile in `find .config -mindepth 1 -maxdepth 1`; do
  from="${PWD}/${dotfile}"
  dest="${HOME}/${dotfile}"
  echo "    $dest -> $from"
  rm -rf $dest
  ln -s $from $dest
done

echo ""
echo "Create dotfiles...Done!"
