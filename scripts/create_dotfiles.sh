#!/bin/bash -eu

# Link dotfiles/ per directory so that files added later are picked up too.
# Directories in FILE_LEVEL_DIRS are linked per file instead, because
# credentials live alongside the config. ~/.claude is left to setup_claude.sh.

# gh: hosts.yml holds the auth token
FILE_LEVEL_DIRS="gh"

echo "Create dotfiles..."

cd ${PWD}/dotfiles

link() {
  local from=$1
  local dest=$2
  echo "    $dest -> $from"
  rm -rf "$dest"
  ln -s "$from" "$dest"
}

echo ""
echo "files in \$HOME:"
for dotfile in `find . -mindepth 1 -maxdepth 1 -not -name '.config' -not -name '.claude'`; do
  dotfile=$(echo $dotfile | sed 's/^\.\///')
  link "${PWD}/${dotfile}" "${HOME}/${dotfile}"
done

echo ""
echo "files in \$HOME/.config:"
mkdir -p "${HOME}/.config"
for dotfile in `find .config -mindepth 1 -maxdepth 1`; do
  name=$(basename $dotfile)

  if echo " $FILE_LEVEL_DIRS " | grep -q " $name "; then
    mkdir -p "${HOME}/${dotfile}"
    for file in `find $dotfile -mindepth 1 -maxdepth 1`; do
      link "${PWD}/${file}" "${HOME}/${file}"
    done
    continue
  fi

  link "${PWD}/${dotfile}" "${HOME}/${dotfile}"
done

echo ""
echo "Create dotfiles...Done!"
