# Keybindings

bindkey -e
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "^Q" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
# bindkey "^H" backward-kill-line
bindkey "^Z" undo
bindkey "^[m" copy-prev-shell-word

# bindkey '\ew' kill-region
# bindkey -s '\el' "ls\n"
# bindkey '^r' history-incremental-search-backward
# bindkey "^[[5~" up-line-or-history
# bindkey "^[[6~" down-line-or-history

# # make search up and down work, so partially type and hit up/down to find relevant stuff
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# bindkey "^[[H" beginning-of-line
# bindkey "^[[1~" beginning-of-line
# bindkey "^[OH" beginning-of-line
# bindkey "^[[F"  end-of-line
# bindkey "^[[4~" end-of-line
# bindkey "^[OF" end-of-line
# bindkey ' ' magic-space    # also do history expansion on space

# bindkey "^[[1;5C" forward-word
# bindkey "^[[1;5D" backward-word

# bindkey '^[[Z' reverse-menu-complete

# # Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
# bindkey '^?' backward-delete-char
# bindkey "^[[3~" delete-char
# bindkey "^[3;5~" delete-char
# bindkey "\e[3~" delete-char

# consider emacs keybindings:

#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
