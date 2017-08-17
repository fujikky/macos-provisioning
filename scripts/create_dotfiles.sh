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
            cp -Rf "$PWD/$dotfile" $HOME
            ;;
    esac
done

echo "Create dotfiles...Done!"
