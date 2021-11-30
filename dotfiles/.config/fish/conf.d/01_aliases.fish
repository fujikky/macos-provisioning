# aliases

alias g="git"
alias y="yarn"
alias b="bundle"

alias ll="ls -lha"
alias ip="ifconfig -a | grep inet[^6] | sed 's/.*inet[^6][^0-9]*\([0-9.]*\)[^0-9]*.*/\1/' | grep -v '^127\.'"

alias ios-simulator="open (xcode-select -p)/Applications/Simulator.app"
alias android-simulator="~/Library/Android/sdk/emulator/emulator -avd (~/Library/Android/sdk/emulator/emulator -list-avds | head)"
