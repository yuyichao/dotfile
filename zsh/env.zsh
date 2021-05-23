# Init environment variables

# [[ -z $DISPLAY ]] && {
#     export LANG=en_US.UTF-8
# } || {
#     export LANG=zh_CN.UTF-8
# }

export EDITOR=emacs

[[ -d "${HOME}/bin" ]] && ! [[ ":${PATH}:" =~ ":${HOME}/bin:" ]] && {
    export PATH="${HOME}/bin:${PATH}"
}

[[ -d "/mingw64/bin" ]] && ! [[ ":${PATH}:" =~ ":/mingw64/bin:" ]] && {
    export PATH="/mingw64/bin:${PATH}"
}

case "$COLORTERM" in
    Terminal)
        export TERM=xterm-256color
        ;;
esac

_cwflags='-Wunused-result -Wno-sign-compare -Wno-unused-parameter -Wno-clobbered'
_cwflags="${_cwflags} -Wno-unknown-warning-option -fasynchronous-unwind-tables"

export LESS=-R
export PAGER="less -R"
if (which uname; [[ $(uname) = Linux ]]) &> /dev/null; then
    export LDFLAGS='-Wl,--as-needed'
else
    export LDFLAGS=''
fi
export CFLAGS="-g -Wall -Wextra ${_cwflags} -pipe"
export CXXFLAGS="-g -Wall -Wextra ${_cwflags} -pipe"
if [[ -n $MAKEFLAGS ]]; then
    export MAKEFLAGS="$MAKEFLAGS --no-print-directory"
elif (which nproc && nproc) &> /dev/null; then
    np=$(nproc 2> /dev/null)
    if [[ -z $np ]]; then
        np=1
    fi
    export MAKEFLAGS="-j$np -l$np --no-print-directory"
else
    export MAKEFLAGS="--no-print-directory"
fi

if [[ $(gcc -dumpmachine 2> /dev/null) =~ ^i686 ]]; then
    CFLAGS+=' -march=pentium4'
    CXXFLAGS+=' -march=pentium4'
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
