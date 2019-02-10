set __fish_git_prompt_showcolorhints true
set __fish_git_prompt_show_informative_status true

set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_upstream_prefix ' '

set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_shorten_branch_len 30

# function fish_right_prompt
# 	if test $CMD_DURATION -gt 2000
#         set_color grey
#         printf '« %ssec »' (math $CMD_DURATION/1000)
#         set_color normal

#     end
# end

function fish_prompt
    # echo -n (prompt_pwd) # abbreviated working directory

    printf '\n'

    function start_section
        set_color grey
        printf '» '
        set_color normal
    end

    function end_section
        printf ' '
        set_color normal
    end

    start_section
    set_color $fish_color_cwd
    if test (string length $PWD) -gt 50
        printf '%s' (prompt_pwd)
    else
        printf '%s' $PWD
    end
    end_section

    start_section
    printf '%s ' (__fish_git_prompt)
    end_section

	if test $CMD_DURATION -gt 2000
        start_section
        set_color grey
        printf '| %ssec |' (math $CMD_DURATION/1000)
        end_section
    end

    printf '\n» '  # ❯
 
    # printf '\n%s %s \n» ' (prompt_pwd) (__fish_git_prompt)  # ❯ 
    # __fish_git_prompt
end
