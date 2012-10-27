# Init files loader

# Load all options first
source "$ZSH/options.zsh"

# Set environment variables
source "$ZSH/env.zsh"

eval $(dircolors)
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit
compinit -i

# Load all rc files
for config_file in "$ZSH/script/"*.zsh; do
    source "$config_file"
done
return

# add a function path
fpath=("$ZSH/functions" "$ZSH/completions" "${fpath[@]}")
