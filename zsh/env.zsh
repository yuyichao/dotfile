# Init environment variables

[[ -z $DISPLAY ]] && {
    export LANG=en_US.UTF-8
} || {
    export LANG=zh_CN.UTF-8
}

export EDITOR=em

[[ -d "$HOME/bin" ]] && ! [[ ":${PATH}:" =~ ":${HOME}/bin:" ]] && {
    export PATH="${PATH}:${HOME}/bin"
}

case "$COLORTERM" in
    Terminal)
        export TERM=xterm-256color
        ;;
esac

export PAGER="less -R"
