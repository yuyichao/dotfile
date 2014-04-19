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

export LESS=-R
export PAGER="less -R"
export LDFLAGS='-Wl,--as-needed'
export CFLAGS='-g -Wall -Wextra -Wunused-result -pipe'
export CXXFLAGS='-g -Wall -Wextra -Wunused-result -pipe'
export MAKEFLAGS='-j 3 --no-print-directory'
