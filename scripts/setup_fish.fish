#!/usr/bin/env fish

echo "Setup fish..."

if not functions -q fisher
  curl -sL https://git.io/fisher | source
end

fisher install jorgebucaran/fisher
fisher install decors/fish-ghq
fisher install PatrickF1/fzf.fish

echo "Setup fish...Done!"
