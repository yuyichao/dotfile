#Set PS's

# PS1=$'%{\e[01;31m%}%m%{\e[01;35m%}:%{\e[01;34m%}%~\n%{\e[01;32m%}%n%{\e[01;36m%}%# %{\e[00m%}'
PS1=$'%{\e[01;32m%}%n%{\e[01;36m%}%# %{\e[00m%}'
PS2=$'%{\e[01;31m%}> %{\e[00m%}'

# Set Term Title
TERM_TITLE="%~"

set_term_title() {
    local title="$1"
    if [[ -n "$ET_VERSION" ]]; then
        # et does not get pick up by konsole as remote so we can set the host
        # in the title maually.
        title="$(print -nP "%m") : $title"
    fi
    case $TERM in
        sun-cmd)
            print -n "\e]l"
            print -nR "$title" | tr '\n' ' ' | sed -e 's/[[:space:]]\+/ /g'
            print -n "\e\\"
            ;;
        *xterm*|rxvt|dtterm|kterm|Eterm)
            print -n "\e]2;"
            print -nR "$title" | tr '\n' ' ' | sed -e 's/[[:space:]]\+/ /g'
            print -n "\a"
            ;;
    esac
}

function _term_title_precmd {
    if [[ -n "${IN_NIX_SHELL}" ]]; then
        print -P $'%{\e[01;33m%}%m(nix)%{\e[01;35m%}:%{\e[01;34m%}%~'
    else
        print -P $'%{\e[01;31m%}%m%{\e[01;35m%}:%{\e[01;34m%}%~'
    fi
    set_term_title "$(print -nP "${TERM_TITLE}")"
}

function _term_title_preexec {
    set_term_title "$(print -nP "%~"):$1"
}

autoload -U add-zsh-hook
add-zsh-hook precmd  _term_title_precmd
add-zsh-hook preexec _term_title_preexec
