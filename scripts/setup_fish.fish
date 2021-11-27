#!/usr/bin/env fish

if not functions -q fisher
  curl -sL https://git.io/fisher | source
end

fisher install jorgebucaran/fisher
fisher install decors/fish-ghq
