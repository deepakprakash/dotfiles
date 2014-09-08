# Shows a confirmation dialog in OSX with the message passed in as the
# first argument. Returns success if user clicks `Ok` and failure if
# clicked on `Cancel`.

confirm_dialog () {
    local x=`/usr/bin/osascript 2>/dev/null <<EOT
tell application "System Events"
    activate
    set myReply to button returned of (display dialog "$1" )
end tell
EOT`

    if [[ $x = "OK" ]]
    then
        # User clicked on Ok
        return 0
    fi

    # User clicked on Cancel'
    return 1
}
