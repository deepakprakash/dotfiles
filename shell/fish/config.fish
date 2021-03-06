# Fish color theme based on ansi-16 colors
# https://fishshell.com/docs/current/index#variables-color
set -g fish_color_autosuggestion normal
set -g fish_color_cancel brmagenta
set -g fish_color_command blue
set -g fish_color_comment white
set -g fish_color_cwd green
set -g fish_color_cwd_root brred
set -g fish_color_end brgreen
set -g fish_color_error red
set -g fish_color_escape cyan
set -g fish_color_history_current normal
set -g fish_color_host bryellow
set -g fish_color_host_remote brred
set -g fish_color_match magenta
set -g fish_color_normal normal
set -g fish_color_operator brcyan
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection bryellow
set -g fish_color_search_match \x2d\x2dbackground\x3dwhite
set -g fish_color_selection white
set -g fish_color_status red
set -g fish_color_user bryellow
set -g fish_color_valid_path normal
set -g fish_pager_color_completion brcyan
set -g fish_pager_color_description yellow
set -g fish_pager_color_prefix white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
set -g fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan

set -g EDITOR vim

# Add $HOME/bin to PATH if it exists
if test -d $HOME/bin
    # https://fishshell.com/docs/2.4/tutorial.html#tut_path
    set --prepend fish_user_paths $HOME/bin
end
