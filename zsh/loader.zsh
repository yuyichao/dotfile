# Load all rc files

# Load all options first
source "$ZSH/options.zsh"

# Set environment variables
source "$ZSH/env.zsh"

for config_file in "$ZSH/script/"*.zsh; do
    source "$config_file"
done

return

# add a function path
fpath=("$ZSH/functions" "$ZSH/completions" "${fpath[@]}")

is_plugin() {
    local base_dir="$1"
    local name="$2"
    test -f "$base_dir/plugins/$name/$name.plugin.zsh" ||
    test -f "$base_dir/plugins/$name/_$name"
}

# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin in "${plugins[@]}"; do
    if is_plugin "$ZSH_CUSTOM" "$plugin"; then
        fpath=("$ZSH_CUSTOM/plugins/$plugin" "${fpath[@]}")
    elif is_plugin "$ZSH" "$plugin"; then
        fpath=("$ZSH/plugins/$plugin" "${fpath[@]}")
    fi
done

# Load and run compinit
autoload -U compinit
compinit -i

# Load all of the plugins that were defined in ~/.zshrc
for plugin in "${plugins[@]}"; do
    if [[ -f "$ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh" ]]; then
        source "$ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh"
    elif [ -f "$ZSH/plugins/$plugin/$plugin.plugin.zsh" ]; then
        source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
    fi
done
