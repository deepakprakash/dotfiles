alias history="fc -l 1"
alias w="which"

alias internet\?="ping 8.8.8.8"
alias serve="python -m SimpleHTTPServer"
alias ip='curl curlmyip.com'

# cat with highlight
alias cah="pygmentize -g"

# highest rated results first
alias z="_z -r 2>&1"

# copy with a progress bar.
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

# Commonly used `tree` levels
alias t2="tree -L 2"
alias t3="tree -L 3"
