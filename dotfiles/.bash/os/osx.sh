
### PATH for Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:~/.bin:$PATH"

### Java
export JAVA_HOME=/Library/Java/Home

### Git
export GIT_EDITOR="/usr/bin/vim"

### Added by the Heroku Toolbelt
if [[ -s "/usr/local/heroku/bin" ]] ; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi

# nodebrew
if [[ -s "$HOME/.nodebrew/current/bin" ]] ; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# rbenv
if [[ -s "/usr/local/bin/rbenv" ]] ; then
    eval "$(rbenv init -)"
fi

# android
if [[ -s "$HOME/Development/adt-bundle-current" ]] ; then
    export "PATH=$HOME/Development/adt-bundle-current/sdk/platform-tools:$PATH"
fi

if [[ -s "$HOME/.aws_config" ]] ; then
    source $HOME/.aws_config
fi

# AppEngine
if [[ -s "$HOME/SDK/go_appengine" ]] ; then
    export "PATH=$HOME/SDK/go_appengine:$PATH"
fi
