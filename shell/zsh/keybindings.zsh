# Use the vim keybindings
bindkey -e

# option + right/left
bindkey '\e\e[C' vi-forward-word
bindkey '\e\e[D' vi-backward-word

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

# clear the current line then bring it back after the next command
bindkey -M vicmd 'q' push-line

# zmodload zsh/terminfo

# # start typing + [Up-Arrow] - fuzzy find history forward
# if [[ "${terminfo[kcuu1]}" != "" ]]; then
#   bindkey "${terminfo[kcuu1]}" up-line-or-search
# fi

# # start typing + [Down-Arrow] - fuzzy find history backward
# if [[ "${terminfo[kcud1]}" != "" ]]; then
#   bindkey "${terminfo[kcud1]}" down-line-or-search
# fi

# bindkey '^R' history-incremental-search-backward

# search history using up/down arrows
# autoload -U history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "\e[A" history-beginning-search-backward-end
# bindkey "\e[B" history-beginning-search-forward-end

# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward

# # make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
# bindkey '^?' backward-delete-char
# bindkey '^[[3~' delete-char
# bindkey '^[3;5~' delete-char
# bindkey '\e[3~' delete-char


# BASED ON http://zshwiki.org/home/zle/bindkeys
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
# [[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
# [[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
# [[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
# [[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
# [[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
# [[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish
