# Init environment variables

# [[ -z $DISPLAY ]] && {
#     export LANG=en_US.UTF-8
# } || {
#     export LANG=zh_CN.UTF-8
# }

export EDITOR=emacs

[[ -d "$HOME/bin" ]] && ! [[ ":${PATH}:" =~ ":${HOME}/bin:" ]] && {
    export PATH="${PATH}:${HOME}/bin"
}

case "$COLORTERM" in
    Terminal)
        export TERM=xterm-256color
        ;;
esac

_cwflags='-Wunused-result -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered'
_cwflags="${_cwflags} -Wno-unknown-warning-option"
_cwflags="${_cwflags} -funwind-tables -fasynchronous-unwind-tables"

export LESS=-R
export PAGER="less -R"
export LDFLAGS=''
export LDFLAGS='-Wl,--as-needed'
export CFLAGS="-g -Wall -Wextra ${_cwflags} -pipe"
export CXXFLAGS="-g -Wall -Wextra ${_cwflags} -pipe"
export MAKEFLAGS="-j7 -l8 --no-print-directory"
