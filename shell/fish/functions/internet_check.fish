function internet_check --description "Check internet connectivity using a few different mechanisms."
    # https://unix.stackexchange.com/questions/190513/shell-scripting-proper-way-to-check-for-internet-connectivity
    
    set_color magenta
    printf "Pinging Google DNS...\n"
    ping -c 4 -i .1 -t 4 8.8.8.8
    set_color normal

    set_color cyan
    printf "\nPinging Cloudflare DNS...\n"
    ping -c 4 -i .1 -t 4 1.1.1.1
    set_color normal

    set_color magenta
    printf "\nFetching Google...\n"
    set_color normal
    curl  --max-time 2 -I https://www.google.com

    set_color cyan
    printf "\nFetching Cloudflare...\n"
    set_color normal
    curl  --max-time 2 -I https://www.cloudflare.com

end
