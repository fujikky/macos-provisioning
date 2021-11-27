# homebrew

if [ (uname -m) = "arm64" ]
  set BREW_PATH /opt/homebrew/bin/brew
else
  set BREW_PATH /usr/local/bin/brew
end

if test -x $BREW_PATH
  eval ($BREW_PATH shellenv)
end
