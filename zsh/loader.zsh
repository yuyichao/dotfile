# Init files loader

# Load all options first
source "$ZSH/options.zsh"

# Set environment variables
source "$ZSH/env.zsh"

eval $(dircolors)
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit
compinit -i

__yyc_zle_init_func_handlers=()

yyc_zle_reg_init() {
    local func
    func="$1"
    __yyc_zle_init_func_handlers=("${__yyc_zle_init_func_handlers[@]}" "${func}")
}

# Load all rc files
for config_file in "$ZSH/script/"*.zsh; do
    source "$config_file"
done

unset -f yyc_zle_reg_init

__yyc_zle_init_func() {
    for func in "${__yyc_zle_init_func_handlers[@]}"; do
        "${func}"
        unset -f "${func}"
    done
    unset __yyc_zle_init_func_handlers
    zle -D zle-line-init
    zle -A __yyc_zle_init_func_backup-line-init zle-line-init &> /dev/null
    zle -D __yyc_zle_init_func_backup-line-init &> /dev/null
    unset -f __yyc_zle_init_func
}

zle -N __yyc_zle_init_func
zle -A zle-line-init __yyc_zle_init_func_backup-line-init &> /dev/null
zle -A __yyc_zle_init_func zle-line-init
zle -D __yyc_zle_init_func

return

# add a function path
fpath=("$ZSH/functions" "$ZSH/completions" "${fpath[@]}")
