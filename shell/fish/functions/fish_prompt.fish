set __fish_git_prompt_showcolorhints true
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_color_branch brblue
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_shorten_branch_len 30

set fish_prompt_pwd_dir_length 8
set fish_color_host bryellow
set fish_color_user bryellow


function prompt_pwd_custom --description "Custom replacement that includes indicator when paths are shortened"
    # Original: https://github.com/fish-shell/fish-shell/blob/72d80c3d91bbd35bed0aafb5514c9834bb48e256/share/functions/prompt_pwd.fish
    
    # Dont do anything if in $HOME or in root.
    # root ('/') is checked here because its not handled well by the split, join etc logic afterwards.
    if test \( $PWD = $HOME \) -o \( $PWD = '/' \)
        printf $PWD
        return 0
    end

    # Replace $HOME with "~"
    set realhome ~
    set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)

    if test -z $fish_prompt_pwd_dir_length
        # Printout whole path if $fish_prompt_pwd_dir_length not defined/valid
        printf $tmp
        return 0
    else
        # Shorten to at most $fish_prompt_pwd_dir_length characters per path part

        set --local parts (string split '/' $tmp)  # Split into separate path parts
        set --local parts_processed

        for part in $parts[1..-2]  # Iterate from first part to penultimate (ignore the last one)
            if test (string length $part) -gt $fish_prompt_pwd_dir_length
                set --append parts_processed (string sub --length (math $fish_prompt_pwd_dir_length - 1) $part)'…'  # … ⌿
            else
                set --append parts_processed $part
            end

        end

        # Join to get the final output
        string join '/' $parts_processed $parts[-1]
    end

end

function prompt_pwd_custom_colored

    if test -w $PWD
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd_custom)
        set_color normal
    else
        set_color $fish_color_cwd_root
        printf '%s' (prompt_pwd_custom)
        set_color normal
    end

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

    printf (set_color --dim grey)'› '(set_color normal)(prompt_pwd_custom_colored)(set_color cyan)' » '(set_color normal) # › ❯ ▶ ➞ ➡ ⇒ ➡ 

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
