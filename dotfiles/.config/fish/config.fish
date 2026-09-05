# See more: conf.d/*.fish

# Java
if test -x /usr/libexec/java_home
  set -l java_home (/usr/libexec/java_home 2>/dev/null)
  if test -n "$java_home"
    set -x JAVA_HOME $java_home
  end
end

# Git
set -x GIT_EDITOR /usr/bin/vim

# EDITOR
set -x EDITOR /usr/bin/vim

# Local bin
set -gx PATH $HOME/.local/bin $PATH
