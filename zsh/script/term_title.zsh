# Set Term Title

TERM_TITLE="%~"

set_term_title() {
    case $TERM in
        sun-cmd)
            print -n "\e]l"
            print -nR "$1"
            print -n "\e\\"
            ;;
        *xterm*|rxvt|dtterm|kterm|Eterm)
            print -n "\e]2;"
            print -nR "$1"
            print -n "\a"
            ;;
    esac
}

function _term_title_precmd {
    set_term_title "$(print -nP "${TERM_TITLE}")"
}

function _term_title_preexec {
    set_term_title "$(print -nP "%~"):$1"
}

autoload -U add-zsh-hook
add-zsh-hook precmd  _term_title_precmd
add-zsh-hook preexec _term_title_preexec
