# homebrew
if test -x /usr/local/bin/brew
  set -g fish_user_paths /usr/local/sbin $fish_user_paths
end

if test -x /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end
