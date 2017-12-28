# anyenv
if test -x $HOME/.anyenv
  set -x PATH $HOME/.anyenv/bin $PATH
  # eval (anyenv init - fish) # not working...
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

# ndenv
if test -x $HOME/.anyenv/envs/ndenv
  set -x NDENV_ROOT "$HOME/.anyenv/envs/ndenv"
  set -x PATH "$NDENV_ROOT/bin" $PATH

  set -gx PATH "$NDENV_ROOT/shims" $PATH
  set -gx NDENV_SHELL fish
  command ndenv rehash 2>/dev/null
  function ndenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      eval (ndenv sh-"$command" $argv|psub)
    case '*'
      command ndenv "$command" $argv
    end
  end
end
