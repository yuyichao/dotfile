# Set history file and size

HISTFILE="$ZSH/history"
HISTSIZE=1048576
SAVEHIST=1048576

__init_killring() {
    : ${killring[128]:=''}
}

yyc_zle_reg_init __init_killring
