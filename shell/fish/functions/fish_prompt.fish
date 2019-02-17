set __fish_git_prompt_showcolorhints true
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_color_branch brblue
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_shorten_branch_len 30

set fish_prompt_pwd_dir_length 10
set fish_color_host bryellow
set fish_color_user bryellow

function prompt_cwd
    if test -w $PWD
        set_color $fish_color_cwd
    else
        set_color $fish_color_error
    end

    if test $PWD = $HOME
        printf '%s' $PWD
    else
        printf '%s' (prompt_pwd)
    end

    set_color normal
end

function prompt_git
    # Need to use trim since the git prompt by default has spaces around it
    printf '%s' (string trim (__fish_git_prompt))
end

function prompt_prev_cmd
    if test $CMD_DURATION -gt 2000
        set_color --dim
        printf '%ssec' (math $CMD_DURATION/1000)
        set_color normal
    end
end

function prompt_user_host

    set_color $fish_color_user
    printf '%s' $USER

    set_color $fish_color_host
    printf '@%s' (prompt_hostname)

    set_color normal
end

set VIRTUAL_ENV_DISABLE_PROMPT true
function prompt_python_virtualenv
    if set -q VIRTUAL_ENV
        set_color brmagenta
        printf 'py: %s' (basename $VIRTUAL_ENV)
        set_color normal
    end
end

function fish_prompt_first_line

    printf (set_color --dim grey)'\n#'(set_color normal)

    for section in (prompt_user_host) (prompt_git) (prompt_python_virtualenv)
        if test -z $section
            continue
        end

        printf ' %s ' $section
        
        printf (set_color --dim grey)'»'(set_color normal)

        # Make sure we print only the first part in case of narrow terminals
        if test $COLUMNS -lt 40
            break
        end
    end

    printf '\n'
end

function fish_prompt

    fish_prompt_first_line

    printf (set_color --dim grey)'›'(set_color normal)
    printf ' %s ' (prompt_cwd) # › ❯ ▶ ➞ ➡ ⇒ ➡ 
    printf (set_color cyan)'» '(set_color normal)

end


function previous_command_summary --on-event fish_postexec

    # Save the status for later use.
    set --local real_status $status
    set --local real_cmd_duration $CMD_DURATION

    # argv[1] contains the full commandline. We check if it is empty ot just white space
    # and move forward only if it is not. This is a hack since fish does not update the status
    # and cmd_duration in case of no-op commands such as just a carriage return or comment
    # Since this is a hack, it fails for the comment use case for instance.
    if test -z (string trim $argv[1])
        return 0
    end

    if test $real_status -ne 0
        printf (set_color $fish_color_error)'\nExit Code: %s\n'(set_color normal) $real_status
    end

    if test $real_cmd_duration -gt 2000
        printf (set_color --dim $fish_color_comment)'\nTime: %ssec\n'(set_color normal) (math $real_cmd_duration/1000)

    end

end
