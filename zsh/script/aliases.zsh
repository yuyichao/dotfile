if (which uname; [[ $(uname) = Darwin ]]) &> /dev/null; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias '..=cd ..'
alias -- '-=popd'
alias "nwem=em -nw"
alias "pysh=ipython --profile=pysh"
alias -g '...=../../'
alias -g '....=../../../'
alias -g '.....=../../../../'
alias -g '......=../../../../../'
alias -g '.2=../../'
alias -g '.3=../../../'
alias -g '.4=../../../../'
alias -g '.5=../../../../../'

# Show history
alias history='fc -l 1'

alias afind='ack-grep -il'

alias em='emacs'
alias 'sudo=sudo '
if which nix-shell &> /dev/null; then
    alias 'nix-shell=nix-shell --command zsh'
fi
