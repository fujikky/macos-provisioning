#!/usr/bin/env fish

if not functions -q fisher
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

fisher update
