# .bash_aliases

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias goh='cd ~/Sites/'
alias simpleserver='python -m SimpleHTTPServer'
alias ipfw_setting='sudo ipfw add 12001 fwd 127.0.0.1,8080 tcp from any to me dst-port 80'
alias dnsmasq_reload="sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist && sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist"
alias symbolicatecrash="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/PrivateFrameworks/DTDeviceKitBase.framework/Versions/Current/Resources/symbolicatecrash"
