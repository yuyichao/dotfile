# Init files loader

# Load all options first
source "$ZSH/options.zsh"

# Set environment variables
source "$ZSH/env.zsh"

# Load all rc files
for config_file in "$ZSH/script/"*.zsh; do
    source "$config_file"
done

return

# add a function path
fpath=("$ZSH/functions" "$ZSH/completions" "${fpath[@]}")
# Load and run compinit
autoload -U compinit
compinit -i
