# anyenv
if test -x $HOME/.anyenv
  set -x PATH $HOME/.anyenv/bin $PATH
  # TODO: not works... https://github.com/anyenv/anyenv/issues/69
  # eval (anyenv init - fish)
end

# rbenv
if test -x $HOME/.anyenv/envs/rbenv
  set -x RBENV_ROOT "$HOME/.anyenv/envs/rbenv"
  set -x PATH "$RBENV_ROOT/bin" $PATH

  set -gx PATH "$RBENV_ROOT/shims" $PATH
  set -gx RBENV_SHELL fish
  source "$RBENV_ROOT/libexec/../completions/rbenv.fish"
  command rbenv rehash 2>/dev/null
  function rbenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      source (rbenv "sh-$command" $argv|psub)
    case '*'
      command rbenv "$command" $argv
    end
  end
end

# nodenv
if test -x $HOME/.anyenv/envs/nodenv
  set -x NODENV_ROOT "$HOME/.anyenv/envs/nodenv"
  set -x PATH "$NODENV_ROOT/bin" $PATH

  set -gx PATH "$NODENV_ROOT/shims" $PATH
  set -gx NODENV_SHELL fish
  command nodenv rehash 2>/dev/null
  function nodenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      eval (nodenv sh-"$command" $argv|psub)
    case '*'
      command nodenv "$command" $argv
    end
  end
end
