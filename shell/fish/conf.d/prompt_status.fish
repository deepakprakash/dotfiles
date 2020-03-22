# We want to display an indicator on the prompt with the exit code of the previous
# command, esp if it is non-zero. However we want to do this only on the prompt immediately
# after the execution of the command.
# Fish provides the variable $status, however this is NOT updated on no-op commands
# such as cancelling the commandline or simply carriage return on the commandline, etc
# So we make use of a global variable _prompt_status to enable this.

set --global _prompt_status 0

function _reset_prompt_status --on-event fish_cancel
    # Set it to zero in case of cancelling the commandline
    # TODO: For some reason, this doesn't seem to work for the first cancel.
    set _prompt_status 0
end

function _set_prompt_status --on-event fish_postexec
    # Set the value of _prompt_status either to $status or 0 based on if the previous
    # command was a no-op command or not.

    # Save the real status of the command for later use.
    set --local real_status $status

    # argv[1] contains the full commandline. We check if it is empty ot just white space
    # and set _prompt_status if that is the case. This is a hack.
    # Since this is a hack, it fails for the comment use case for instance.
    if test -z (string trim $argv[1])
        set _prompt_status 0
    else
        set _prompt_status $real_status
    end

end

function prompt_status --description "Status to be displayed in the prompt"
    if test $_prompt_status -ne 0
        printf (set_color $fish_color_error)'⚠ %s'(set_color normal) $_prompt_status
    end
end
