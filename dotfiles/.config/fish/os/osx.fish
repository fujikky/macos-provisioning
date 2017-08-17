
# Java
set -x JAVA_HOME /Library/Java/Home

# Git
set -x GIT_EDITOR /usr/bin/vim

# EDITOR
set -x EDITOR /usr/bin/vim

# homebrew
if test -x /usr/local/bin/brew
    set -x PATH /usr/local/bin /usr/local/sbin $PATH
end

# rbenv
if test -x /usr/local/bin/rbenv
    rbenv init - | source
end

# nodebrew
if test -d $HOME/.nodebrew
    set -x PATH $HOME/.nodebrew/current/bin $PATH
end

# direnv
if test -x /usr/local/bin/direnv
    eval (direnv hook fish)
end
