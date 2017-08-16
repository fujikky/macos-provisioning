
# Java
set -x JAVA_HOME /Library/Java/Home

# Git
set -x GIT_EDITOR /usr/bin/vim

# EDITOR
set -x EDITOR /usr/bin/vim

# homebrew
if test -e (which brew)
    set -x PATH /usr/local/bin /usr/local/sbin $PATH
end

# rbenv
if test -e (which rbenv)
    rbenv init - | source
end

# pyenv
if test -e (which pyenv)
    . (pyenv init - | psub)
end

# nodebrew
if test -e $HOME/.nodebrew
    set -x PATH $HOME/.nodebrew/current/bin $PATH
end

# direnv
if test -e (which direnv)
    eval (direnv hook fish)
end
