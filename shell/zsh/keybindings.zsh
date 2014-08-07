# Use the vim keybindings
bindkey -e

# option + right/left
bindkey '\e\e[C' vi-forward-word
bindkey '\e\e[D' vi-backward-word

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

# clear the current line then bring it back after the next command
bindkey -M vicmd 'q' push-line

zmodload zsh/terminfo
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  # Linux
  bindkey "${terminfo[kcuu1]}" up-line-or-search
# else
#   # Mac
#   bindkey "\e[A" up-line-or-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  # Linux
  bindkey "${terminfo[kcud1]}" down-line-or-search
# else
#   # Mac
#   bindkey "\e[B" down-line-or-search
fi

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
