# aliases

alias be="bundle exec"

alias dc="docker-compose"

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

alias simulator="open (xcode-select -p)/Applications/Simulator.app"

alias ip="ifconfig -a | grep inet[^6] | sed 's/.*inet[^6][^0-9]*\([0-9.]*\)[^0-9]*.*/\1/' | grep -v '^127\.'"
