#!/usr/bin/env fish

echo "Setup fish..."

if not functions -q fisher
  curl -sL https://git.io/fisher | source
end

fisher install jorgebucaran/fisher
fisher install decors/fish-ghq
fisher install PatrickF1/fzf.fish

# Make fish the login shell. $SHELL is not reliable here: it keeps the value of
# whatever started this process, so ask directory services instead.
set -l fish_path (command -v fish)
set -l login_shell (dscl . -read ~/ UserShell | string replace 'UserShell: ' '')

if test "$login_shell" != "$fish_path"
  if not grep -qx "$fish_path" /etc/shells
    echo "Add $fish_path to /etc/shells"
    echo $fish_path | sudo tee -a /etc/shells > /dev/null
  end
  echo "Change the login shell to $fish_path"
  chsh -s $fish_path
end

echo "Setup fish...Done!"
