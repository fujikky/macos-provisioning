# anyenv
if test -x $HOME/.anyenv
  set -g fish_user_paths "$HOME/.anyenv/bin" $fish_user_paths
  status --is-interactive; and source (anyenv init -|psub)
end
