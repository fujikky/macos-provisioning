# anyenv
if test -x $HOME/.anyenv
  set -x PATH "$HOME/.anyenv/bin" $PATH
  status --is-interactive; and source (anyenv init -|psub)
end
