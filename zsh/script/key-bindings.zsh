# Keybindings

bindkey_nonempty() {
    local key="$1"
    local action="$2"
    if [[ -n "$key" ]]; then
        bindkey "$key" "$action"
    fi
}

bindkey -e
bindkey_nonempty "${terminfo[khome]}" beginning-of-line
bindkey_nonempty "^Q" beginning-of-line
bindkey_nonempty "${terminfo[kend]}" end-of-line
bindkey_nonempty "${terminfo[kdch1]}" delete-char
bindkey_nonempty "\e[A" history-beginning-search-backward
bindkey_nonempty "\e[B" history-beginning-search-forward
bindkey_nonempty "^P" history-beginning-search-backward
bindkey_nonempty "^N" history-beginning-search-forward
# bindkey_nonempty "^H" backward-kill-line
bindkey_nonempty "^Z" undo
bindkey_nonempty "^[m" copy-prev-shell-word

# bindkey_nonempty '\ew' kill-region
# bindkey_nonempty -s '\el' "ls\n"
# bindkey_nonempty '^r' history-incremental-search-backward
# bindkey_nonempty "^[[5~" up-line-or-history
# bindkey_nonempty "^[[6~" down-line-or-history

# # make search up and down work, so partially type and hit up/down to find relevant stuff
# bindkey_nonempty '^[[A' up-line-or-search
# bindkey_nonempty '^[[B' down-line-or-search

# bindkey_nonempty "^[[H" beginning-of-line
# bindkey_nonempty "^[[1~" beginning-of-line
# bindkey_nonempty "^[OH" beginning-of-line
# bindkey_nonempty "^[[F"  end-of-line
# bindkey_nonempty "^[[4~" end-of-line
# bindkey_nonempty "^[OF" end-of-line
# bindkey_nonempty ' ' magic-space    # also do history expansion on space

# bindkey_nonempty "^[[1;5C" forward-word
# bindkey_nonempty "^[[1;5D" backward-word

# bindkey_nonempty '^[[Z' reverse-menu-complete

# # Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
# bindkey_nonempty '^?' backward-delete-char
# bindkey_nonempty "^[[3~" delete-char
# bindkey_nonempty "^[3;5~" delete-char
# bindkey_nonempty "\e[3~" delete-char

# consider emacs keybindings:

# bindkey_nonempty '^[[A' up-line-or-search
# bindkey_nonempty '^[[B' down-line-or-search
# bindkey_nonempty '^[^[[C' emacs-forward-word
# bindkey_nonempty '^[^[[D' emacs-backward-word
#
# bindkey_nonempty -s '^X^Z' '%-^M'
# bindkey_nonempty '^[e' expand-cmd-path
# bindkey_nonempty '^[^I' reverse-menu-complete
# bindkey_nonempty '^X^N' accept-and-infer-next-history
# bindkey_nonempty '^W' kill-region
# bindkey_nonempty '^I' complete-word
## Fix weird sequence that rxvt produces
# bindkey_nonempty -s '^[[Z' '\t'
