#!/bin/sh

echo "Create dotfiles..."

cd ${PWD}/dotfiles
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
            rm -rf $HOME/${dotfile}
            cp -r "$PWD/$dotfile" $HOME
            ;;
    esac
done

cd ~
source ~/.bashrc

echo "Create dotfiles...Done!"
