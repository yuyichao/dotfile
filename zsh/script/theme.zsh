#Set PS's

PS1=$'%{\e[01;31m%}%m%{\e[01;35m%}:%{\e[01;34m%}%~\n%{\e[01;32m%}%n%{\e[01;36m%}%# %{\e[00m%}'
PS2=$'%{\e[01;31m%}> %{\e[00m%}'

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
