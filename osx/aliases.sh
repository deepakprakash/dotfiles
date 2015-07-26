# strips formatting from pasteboard
alias scrub='pbpaste | pbcopy'

# Flush DNS
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
