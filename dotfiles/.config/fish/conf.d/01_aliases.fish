# aliases

alias g="git"

alias y="yarn"

alias b="bundle"

alias d="docker"

alias ll="ls -lha"

alias simulator="open (xcode-select -p)/Applications/Simulator.app"

alias ip="ifconfig -a | grep inet[^6] | sed 's/.*inet[^6][^0-9]*\([0-9.]*\)[^0-9]*.*/\1/' | grep -v '^127\.'"
