#!/bin/sh

echo "Create dotfile symlinks..."

cd $(dirname $0)/../dotfiles
for dotfile in .?*; do
    case $dotfile in
        *.elc)
            continue;;
        ..)
            continue;;
        .git)
            continue;;
        .gitignore)
            continue;;
        .gitmodules)
            continue;;
        *)
            echo "    ${HOME}/${dotfile}"
            ln -fs "$PWD/$dotfile" $HOME
            ;;
    esac
done

cd ~
source ~/.bashrc

echo "Create dotfile symlinks...Done!"
