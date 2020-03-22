function externalip --description "Get the external IP address."
    # https://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-a-shell-script
    dig +short myip.opendns.com @resolver1.opendns.com
end
