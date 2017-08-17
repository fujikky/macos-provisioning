#!/usr/local/bin/fish

if test -e ~/.config/fish/functions/fisher.fish
else
  echo "Install fisherman"
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
end

fisher
